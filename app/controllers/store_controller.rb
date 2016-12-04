class StoreController < ApplicationController
  before_action :initialize_session
  def home
    @products = Product.all.page(params[:page]).per(2)
    @product_catagories = Catagory.all
    @deck_size = 4

    if params[:product_cat_list]
      # @catagories = @product_catagories.where(id: params[:search])
      # @products = Product.joins(:catagories)
    end

    if params[:search]
      # @products = @products.where(
      #               " Product.name LIKE ? OR Product.description LIKE ?",
      #               "%#{params[:search]}%",
      #               "%#{params[:search]}%")
    end
    @current_cart = session[:cart]
  end

  def about_us
    @about_us_paragraph_text = About.exists? ? first.about_us_description : 'Default About us message'
  end

  # rubocop:disable MethodName
  def FAQ
  end
  # rubocop:enable MethodName

  def search
  end

  def sign_up
  end

  def sign_out
    session.delete(:user)
    redirect_to :back
  end

  def create_new_user
    user_name = params[:my_data][:user_name]
    password = params[:my_data][:password]
    first_name = params[:my_data][:first_name]
    last_name = params[:my_data][:last_name]
    email = params[:my_data][:email]
    address = params[:my_data][:address]
    city = params[:my_data][:city]
    province = params[:my_data][:province]

    @new_customer = Customer.new(first_name: first_name,
                                 last_name: last_name,
                                 email: email,
                                 home_address: address,
                                 city: city,
                                 province_id: province)

    if @new_customer.valid?
      @new_user = User.new(user_name: user_name, password: password, customer: @new_customer)
      if @new_user.valid?
        @new_user.save
        session[:user] = @new_user.user_name
        redirect_to root_path
      else
        render json: { error: @new_user.errors }
      end
    else
      render json: { error: @new_customer.errors }
    end
  end

  def create_new_order
    first_name = params[:my_data][:first_name]
    last_name = params[:my_data][:last_name]
    email = params[:my_data][:email]
    address = params[:my_data][:address]
    city = params[:my_data][:city]
    province = params[:my_data][:province]
	
	if session[:user]
      @new_customer = User.find_by(user_name: session[:user]).customer
	else
	  @new_customer = Customer.new
	end
	
	fill_customer_record(@new_customer, first_name, last_name, email, address, city, province)

    # We basically want to ensure the customer and order are valid, for quick validation.
    # The order or customer won't be saved.
    if @new_customer.valid?
	  @new_order = Order.new
      @new_order.assign_attributes(customer: @new_customer)
	  order_items = []
	  
	  session[:cart].each do |cart_item|
	    @new_order_item = OrderItemTable.new
		@product = Product.find(cart_item['product_id'])
		@new_order_item.assign_attributes(
			product: @product,
			amount_ordered: cart_item['number_of_items'],
			tax_rate_used: 0.0,
			price_per_item: @product.price)
		order_items << @new_order_item
      end

	  @new_order.assign_attributes(order_item_tables: order_items)
	  
      if @new_order.valid?
	    @new_order.save
        # Note: We're setting it to customer here
        session[:order] = @new_customer
        redirect_to '/store/order_summary'
	  else
	    render json: { error: @new_order.errors }
	  end
	  #render json: { error: @new_customer.errors }
    end
  end

  def order_summary
    province = Province.find(session[:order]['province_id'])
    tax_rate = (province.gst + province.pst + province.hst)
    @products = []
    @total_before_taxes = 0.0
    @total_taxes = 0.0
    @grand_total = 0.0

    session[:cart].each do |cart_item|
      product = Product.find(cart_item['product_id'])
      @products << product
      product_cost = product.price * cart_item['number_of_items']
      @total_before_taxes += product_cost
      @total_taxes += (tax_rate * product_cost)
    end
    @current_cart = session[:cart]
    @grand_total = (@total_before_taxes + @total_taxes)
  end

  def contact
    # process this as html
    # rubocop:disable Rails/OutputSafety
    @contact_us_html_message = ContactInfo.exists? ? ContactInfo.first.contact_page_text.html_safe : 'Default Contact Us Message.'
    # rubocop:enable Rails/OutputSafety
  end

  def cart
    @cart_items = []
    @current_cart = session[:cart]

    session[:cart].each do |cart_item|
      @cart_items <<
        Product.find(cart_item['product_id'])
    end

    # @cart_items = Product.find(session[:cart])
  end

  def check_out
    @current_cart = session[:cart]

    if session[:user]
      logged_in_user = User.find_by(user_name: session[:user]).customer
      @first_name = logged_in_user.first_name
      @last_name = logged_in_user.last_name
      @email = logged_in_user.email
      @address = logged_in_user.home_address
      @city = logged_in_user.city
      @province = logged_in_user.province_id
    end
  end

  def remove_item_from_cart
    # Get the product id as an integer
    product_id = params[:id].to_i

    # Remove item from cart, if it exists (it should exist at this point)
    session[:cart].delete_if { |h| h['product_id'] == product_id }

    # No view associated with this method, go back
    redirect_to :back
  end
  
  def finished_purchase
     session.delete(:cart)
  end

  def finalize_order
    province = Province.find(session[:order]['province_id'])
    tax_rate = (province.gst + province.pst + province.hst)
    @products = []
    @total_before_taxes = 0.0
    @total_taxes = 0.0
    @grand_total = 0.0

    session[:cart].each do |cart_item|
      product = Product.find(cart_item['product_id'])
      @products << product
      product_cost = product.price * cart_item['number_of_items']
      @total_before_taxes += product_cost
      @total_taxes += (tax_rate * product_cost)
    end
	
    values = {
      # get it form your http://sandbox.paypal.com account
      business: 'lionelbergen-facilitator@live.com',
      cmd: '_cart',
      notify_url: "http://localhost:3000/store/finished_purchase",
      upload: 1,
      return: 'http://localhost:3000'
    }

    session[:cart].each.with_index do |cart_item, i|
      product = Product.find(cart_item['product_id'])

      values.merge!(
        "amount_#{i + 1}" => product.price.to_f,
        "item_name_#{i + 1}" => product.name,
        "item_number_#{i + 1}" => cart_item['product_id'],
        "quantity_#{i + 1}" => cart_item['number_of_items']
      )
    end

    redirect_to 'https://www.sandbox.paypal.com/cgi-bin/webscr?' + values.to_query
  end

  private

  # Used to setup a shopping cart
  def initialize_session
    session[:cart] ||= []
  end
  
  def fill_customer_record(new_customer, first_name, last_name, email, home_address, city, province)
    new_customer.assign_attributes(first_name: first_name,
                                    last_name: last_name,
                                    email: email,
                                    home_address: home_address,
                                    city: city,
                                    province_id: province)
  end
end

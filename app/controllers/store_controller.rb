class StoreController < ApplicationController
  before_action :initialize_session
  def home
    @products = Product.all.page(params[:page]).per(2)
	@product_catagories = Catagory.all
	@deck_size = 4
	
    if params[:product_cat_list]
	  #@catagories = @product_catagories.where(id: params[:search])
	  #@products = Product.joins(:catagories)
	end
  
  
    if params[:search]
	  #@products = @products.where(" Product.name LIKE ? OR Product.description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
	end
	@current_cart = session[:cart]
  end

  def about_us
    @about_us_paragraph_text = About.exists? ? first.about_us_description : "Default About us message"
  end

  def FAQ
  end

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
	
	@new_customer = Customer.new(:first_name => first_name, 
								   :last_name => last_name,
								   :email => email,
								   :home_address => address,
								   :city => city,
								   :province_id => province)
								   
	if @new_customer.valid?
	  @new_user = User.new(:user_name => user_name, :password => password, :customer => @new_customer)
	  if @new_user.valid?
		@new_user.save
		session[:user] = @new_user.user_name
	    redirect_to root_path
	  else
	    render json: {error: @new_user.errors}
	  end
	else
	  render json: {error: @new_customer.errors}
	end
  end
  
  def create_new_order
	first_name = params[:my_data][:first_name]
	last_name = params[:my_data][:last_name]
	email = params[:my_data][:email]
	address = params[:my_data][:address]
	city = params[:my_data][:city]
	province = params[:my_data][:province]
	
	@new_customer = Customer.new(:first_name => first_name, 
								   :last_name => last_name,
								   :email => email,
								   :home_address => address,
								   :city => city,
								   :province_id => province)
								   
	if @new_customer.valid?
	  @new_user = User.new(:user_name => user_name, :password => password, :customer => @new_customer)
	  if @new_user.valid?
		#@new_user.save
		#session[:user] = @new_user.user_name
	    #redirect_to root_path
	  else
	    render json: {error: @new_user.errors}
	  end
	else
	  render json: {error: @new_customer.errors}
	end
  end

  def contact
    # process this as html
    @contact_us_html_message = ContactInfo.exists? ? ContactInfo.first.contact_page_text.html_safe : "Default Contact Us Message."
  end
  
  def cart
    @cart_items = []
	@current_cart = session[:cart]
	
	session[:cart].each do |cart_item|
	  @cart_items << Product.find(cart_item['product_id'])
	end
	
    #@cart_items = Product.find(session[:cart])
  end
  
  def check_out
    @total_before_taxes = 0.0
	@tax_total = 0.0
    @cart_items = []
	@current_cart = session[:cart]
	
	if session[:user]
	  logged_in_user = User.find_by(user_name: session[:user]).customer
	  @first_name = logged_in_user.first_name
	  @last_name = logged_in_user.last_name
	  @email = logged_in_user.email
	  @address = logged_in_user.home_address
	  @city = logged_in_user.city
	  @province = logged_in_user.province
	end
	
	session[:cart].each do |cart_item|
	  product = Product.find(cart_item['product_id'])
	  @cart_items << product
	  @total_before_taxes += (product.price * cart_item['number_of_items'])
	  #@tax_total += ((product.gst + product.hst + product.pst) * product.price)
	end
  end
  
  def remove_item_from_cart
    # Get the product id as an integer
	product_id = params[:id].to_i
	   
	# Remove item from cart, if it exists (it should exist at this point)
	session[:cart].delete_if { |h| h["product_id"] == product_id }
	   
	# No view associated with this method, go back
	redirect_to :back
  end
  
  private
    # Used to setup a shopping cart
	def initialize_session
	   session[:cart] ||= {}
	end
end

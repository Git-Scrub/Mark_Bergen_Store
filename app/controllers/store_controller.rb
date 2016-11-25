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
  
  def create_new_user
    user_name = params[:my_data][:user_name]
	password = params[:my_data][:password]
	first_name = params[:my_data][:first_name]
	last_name = params[:my_data][:last_name]
	email = params[:my_data][:email]
	address = params[:my_data][:email]
	city = params[:my_data][:city]
	
	@new_user = User.new(:user_name => user_name, :password => password)
	
	if @new_user.valid?
	  @new_customer = Customer.new(:first_name => first_name, 
								   :last_name => last_name,
								   :email => email,
								   :home_address => address,
								   :city => city)
	  if @new_customer.valid?
	    @new_user.save
		@new_customer.save
	    redirect_to root_path
	  else
	    render json: {error: @new_customer.errors}
	  end
	else
	  # return error if the new user cannot be created
	  render json: {error: @new_user.errors }
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

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

  def contact
    # process this as html
    @contact_us_html_message = ContactInfo.exists? ? ContactInfo.first.contact_page_text.html_safe : "Default Contact Us Message."
  end
  
  def cart
    @cart_items = Product.find(session[:cart])
  end
  
  def cart_contains product
    return session[:cart].contains(product)
  end
  
  def remove_item_from_cart
    # Get the product id as an integer
	product_id = params[:id].to_i
	   
	# Remove item from cart, if it exists (it should exist at this point)
	session[:cart].delete(product_id) unless not session[:cart].include?(product_id)
	   
	# No view associated with this method, go back
	redirect_to :back
  end
  
  private
    # Used to setup a shopping cart
	def initialize_session
	   session[:cart] ||= []
	end
end

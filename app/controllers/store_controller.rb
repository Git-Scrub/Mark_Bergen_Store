class StoreController < ApplicationController
  def home
    @products = Product.all.page(params[:page]).per(2)
	@product_catagories = Catagory.all
	@deck_size = 4
	
    if params[:product_cat_list]
	  #@catagories = @product_catagories.where(id: params[:search])
	  @products = Product.joins(:catagories)
	end
  
  
    if params[:search]
	  #@products = @products.where(" Product.name LIKE ? OR Product.description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
	end
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
end

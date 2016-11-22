class StoreController < ApplicationController
  def home
    if params[:search]
	  @products = Product.where(" name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
	else
      @products = Product.all
	end
	
	if params[:product_cat_list]
	  @products = @products.where("product_type_id IN (?)", params[:product_cat_list])
	end
	
	@product_catagories = ProductType.all
	@deck_size = 4
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
end

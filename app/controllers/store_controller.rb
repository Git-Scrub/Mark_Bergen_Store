class StoreController < ApplicationController
  def home
    @products = Product.all
	@deck_size = 4
  end

  def about_us
    @about_us_paragraph_text = About.first.about_us_description
  end

  def FAQ
  end

  def search
  end

  def contact
    @contact_us_message = 
  end
end

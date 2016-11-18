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
    # process this as html
    @contact_us_html_message = ContactInfo.first.contact_page_text.html_safe
  end
end

class StoreController < ApplicationController
  def home
    @products = Product.all
	@deck_size = 4
  end

  def about_us
  end

  def FAQ
  end

  def search
  end

  def contact
  end
end

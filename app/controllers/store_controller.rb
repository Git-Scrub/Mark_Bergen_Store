class StoreController < ApplicationController
  def home
    @products = Product.all
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

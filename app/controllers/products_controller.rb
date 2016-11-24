class ProductsController < InheritedResources::Base
   before_action :initialize_session
   
   def show
	   @product = Product.find(params[:id])
	   @product_types = @product.nil? ? [] : @product.catagories
   end
   def add_to_cart
	   # Get the product id as an integer
	   product_id = params[:id].to_i
	   
	   # Add the product to our cart, unless it's already in our cart.
	   session[:cart] << product_id unless session[:cart].include?(product_id)
	   
	   # No view associated with this method, go back
	   redirect_to :back
	end
	
  private
    def product_params
	  # We don't want users to be able to modify/add/delete products.
      #params.permit(:name, :description, :price, :id, :catagory_id)
    end
	
	# Used to setup a shopping cart
	def initialize_session
	   session[:cart] ||= []
	end
end


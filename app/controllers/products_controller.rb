class ProductsController < InheritedResources::Base
   before_action :initialize_session
   
   def show
	   @product = Product.find(params[:id])
	   @product_types = @product.nil? ? [] : @product.catagories
   end
   
   def add_to_cart
	   # Get the product id as an integer
	   product_id = params[:id].to_i
	   
	   # Create a cart item
	   cart_item = {product_id: params[:id].to_i, number_of_items: 1}
	   
	   # Add the product to our cart, unless it's already in our cart.
	   session[:cart] << cart_item unless session[:cart].any? { |ci| ci[:product_id] ==  product_id}
	   
	   # No view associated with this method, go back
	   redirect_to :back
	end
	
	def add_existing_to_cart
	  # Get the product id as an integer
	  product_id = params[:id].to_i
	  
	  item = session[:cart].select{ |ci| ci['product_id'] ==  product_id}.first
	  item['number_of_items'] += 1
	  
	  render json: item['number_of_items']
	end
	
	def remove_existing_from_cart
	  # Get the product id as an integer
	  product_id = params[:id].to_i
	  
	  item = session[:cart].select{ |ci| ci['product_id'] ==  product_id}.first
	  
	  if item['number_of_items'] > 1 then
	    item['number_of_items'] -= 1
	    render json: item['number_of_items']
	  end
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


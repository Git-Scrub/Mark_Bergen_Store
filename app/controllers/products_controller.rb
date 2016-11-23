class ProductsController < InheritedResources::Base
   def show
	   @product = Product.find(params[:id])
	   @product_types = @product.nil? ? [] : @product.catagories
	end
  private
    def product_params
	  # We don't want users to be able to modify/add/delete products.
      #params.permit(:name, :description, :price, :id, :catagory_id)
    end
end


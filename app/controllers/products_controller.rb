class ProductsController < InheritedResources::Base

  #private
  #  def product_params
	  # We don't want users to be able to modify/add/delete products.
      #params.require(:product).permit(:name, :description, :price, :product_type_id)
#    end
	
	def show
	   @product = Product.find(params[:id])
	   @product_types = @product.nil? ? [] : @product.catagories
	end
end


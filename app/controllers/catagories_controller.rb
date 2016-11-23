class CatagoriesController < InheritedResources::Base

    private
      def product_params
        params.permit(:name, :id, :product_id)
	  end
end
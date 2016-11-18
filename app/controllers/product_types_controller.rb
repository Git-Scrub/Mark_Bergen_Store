class ProductTypesController < InheritedResources::Base

  private

    def product_type_params
      #params.require(:product_type).permit(:name)
    end
end


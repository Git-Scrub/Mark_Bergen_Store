class CatagoriesProducts < InheritedResources::Base
  private

    def product_params
      params.permit(:id, :catagory_id, :product_id)
    end
end

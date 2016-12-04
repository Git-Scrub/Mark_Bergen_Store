class CustomerProvinces < InheritedResources::Base
  private

  def product_params
    params.permit(:id, :province_id, :customer_id)
  end
end

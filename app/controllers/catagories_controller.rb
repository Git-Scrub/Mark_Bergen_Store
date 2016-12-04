class CatagoriesController < InheritedResources::Base
  def index
    @product_types = Catagory.all
  end

  def show
    @product_type = Catagory.find(params[:id])
  end

  private

  def product_params
    params.permit(:name, :id, :product_id)
  end
end

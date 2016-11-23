class CreateProductWithTypesFix < ActiveRecord::Migration[5.0]
  def change
    create_table :catagories_products, id: false do |t|
	   t.belongs_to :catagory, index: true
	   t.belongs_to :product, index: true
	end 
  end
end

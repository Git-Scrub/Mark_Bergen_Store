class AddProductTypeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :product_types, :products, foreign_key: true
  end
end

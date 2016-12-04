class AddProductsToOrderItemTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_item_tables, :product, foreign_key: true
  end
end

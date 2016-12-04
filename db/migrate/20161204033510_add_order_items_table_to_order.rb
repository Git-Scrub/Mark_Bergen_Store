class AddOrderItemsTableToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :order_item_table, foreign_key: true
  end
end

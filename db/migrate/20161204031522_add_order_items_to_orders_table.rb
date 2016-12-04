class AddOrderItemsToOrdersTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_item_tables, :order, foreign_key: true
  end
end

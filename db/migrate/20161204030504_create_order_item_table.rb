class CreateOrderItemTable < ActiveRecord::Migration[5.0]
  def change
    create_table :order_item_tables do |t|
	  t.integer  :amount_ordered
      t.float    :tax_rate_used
      t.float    :price_per_item
    end
  end
end

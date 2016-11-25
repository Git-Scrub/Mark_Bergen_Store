class AddOrderToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_reference :customers, :order, foreign_key: true
  end
end

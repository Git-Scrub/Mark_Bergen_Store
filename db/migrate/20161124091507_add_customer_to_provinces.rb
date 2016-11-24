class AddCustomerToProvinces < ActiveRecord::Migration[5.0]
  def change
    add_reference :provinces, :customer, foreign_key: true
  end
end

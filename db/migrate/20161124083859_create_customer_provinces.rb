class CreateCustomerProvinces < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_provinces, id: false do |t|
	   t.belongs_to :customer, index: true
	   t.belongs_to :province, index: true
	end
  end
end

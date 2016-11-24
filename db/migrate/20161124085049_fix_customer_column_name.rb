class FixCustomerColumnName < ActiveRecord::Migration[5.0]
  def change
    def self.down
	  delete_column :customer, :province
	end
  end
end

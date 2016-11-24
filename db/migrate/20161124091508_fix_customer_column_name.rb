class FixCustomerColumnName < ActiveRecord::Migration[5.0]
  def self.down
    remove_column :customers, :province
  end
end

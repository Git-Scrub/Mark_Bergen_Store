class CreateIpAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_addresses do |t|
      t.string :ip_address
      t.integer :customer_id

      t.timestamps
    end
  end
end

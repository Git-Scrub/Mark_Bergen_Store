class Order < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.timestamps
    end
  end
end

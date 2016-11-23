class CreateProductTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :catagories do |t|
      t.string :name
      t.timestamps
    end
  end
end

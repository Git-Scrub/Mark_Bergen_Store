class CreateProductProductTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_product_types do |t|

      t.timestamps
    end
  end
end

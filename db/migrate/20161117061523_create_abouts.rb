class CreateAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :abouts do |t|
      t.string :about_us_description
      t.string :image

      t.timestamps
    end
  end
end

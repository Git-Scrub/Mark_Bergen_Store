class AddColumnsToProvince < ActiveRecord::Migration[5.0]
  def change
    add_column :provinces, :gst, :decimal, default: 0.0
    add_column :provinces, :pst, :decimal, default: 0.0
    add_column :provinces, :hst, :decimal, default: 0.0
    remove_column :provinces, :tax_rate, :decimal
  end
end

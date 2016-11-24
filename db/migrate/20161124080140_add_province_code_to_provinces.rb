class AddProvinceCodeToProvinces < ActiveRecord::Migration[5.0]
  def change
    add_column :provinces, :province_code, :string
  end
end

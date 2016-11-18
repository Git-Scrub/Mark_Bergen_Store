ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, :product_type_id
end

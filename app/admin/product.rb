ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, :product_product_type_id

  form do |f|
    f.inputs "Product" do
	  f.input :name
	  f.input :description
	  f.input :price
      f.input :product_types, :as => :check_boxes
	  f.input :image
    end
    f.actions
  end
end

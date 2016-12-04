ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, catagory_ids: []

  form do |f|
    f.inputs 'Product' do
      f.input :name
      f.input :description
      f.input :price
      f.input :catagories, as: :check_boxes
      f.input :image
    end
    f.actions
  end
end

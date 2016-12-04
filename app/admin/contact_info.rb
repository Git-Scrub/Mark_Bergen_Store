ActiveAdmin.register ContactInfo do
  permit_params :contact_page_text
  actions :all, except: [:destroy]

  form do |f|
    f.inputs 'Post' do
      f.text_area :contact_page_text, class: 'ckeditor'
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end

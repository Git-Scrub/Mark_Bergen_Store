ActiveAdmin.register Customer do
  permit_params :first_name, :last_name, :email, :home_address, :city, order_ids: []
  
  index do
    id_column
	column :first_name
	column :last_name
	column :email
	column :home_address
	column :created_at
	column :updated_at
	column :city
	column :province
	column :user
	column "orders" do |customer|
	  @link = ''.html_safe
	  customer.orders.each do |order|
	   @link = @link + (link_to order.id, admin_order_path(order)) + ' '.html_safe
	  end
	  
	  @link
	end
	actions
  end
  
  show do
    attributes_table do
	  row :first_name
	  row :last_name
	  row :email
	  row :home_address
	  row :created_at
	  row :updated_at
	  row :city
	  row :province
	  row :user
	  row "orders" do |customer|
	    @link = ''.html_safe
	    customer.orders.each do |order|
	      @link = @link + (link_to order.id, admin_order_path(order)) + ' '.html_safe
	    end
	    @link
	  end
    end
  end
end

ActiveAdmin.register Order do
  permit_params :customer_id, order_item_table_ids: []
  
  index do
	id_column
	column "Customer" do |order|
	  link_to("#{order.customer.first_name} #{order.customer.last_name}", admin_customer_path(order.customer)) unless order.customer.nil?
	end
	column "Order Items" do |order|
	  @link = ''.html_safe
	  order.order_item_tables.each do |order_item|
	    @link = @link + link_to(order_item.id, admin_order_item_table_path(order_item)) + ' '.html_safe
	  end
	  @link
	end
	column "order total before taxes" do |order|
	  @total = 0.0
	  order.order_item_tables.each do |order_item|
	    @total = @total + order_item.amount_ordered * order_item.price_per_item
	  end
	  @total
	end
	actions
  end
  
  show do
    attributes_table do
	  row :created_at
	  row :updated_at
	  row :customer
	  row "Order Items" do |order|
	    @link = ''.html_safe
	    order.order_item_tables.each do |order_item|
	      @link = @link + link_to(order_item.id, admin_order_item_table_path(order_item)) + ' '.html_safe
	    end
	  @link
	  end
	end
  end
  
  form do |f|
    f.inputs 'Order' do
      f.input :customer_id
      f.input :order_item_tables, as: :check_boxes
    end
    f.actions
  end
end

function add_to_cart(product_id)
{
  $.ajax({
	type:'POST',
	url:'/products/' + product_id + '/add_existing_to_cart',
	success:function(data) {
	  var tagetInputClassName = '.form-control.input-number.product-' + product_id;
	  // update the value
	  $(tagetInputClassName).get(0).value = data;
	}
  });
}

function remove_from_cart_product_path(product_id)
{
  var tagetInputClassName = '.form-control.input-number.product-' + product_id;
  
  if($(tagetInputClassName).get(0).value > 1)
  {
    $.ajax({
      type:'POST',
      url:'/products/' + product_id + '/remove_existing_from_cart',
      success:function(data) {
	  
  	    // update the value
  	    $(tagetInputClassName).get(0).value = data;
      }
    });
  }
}
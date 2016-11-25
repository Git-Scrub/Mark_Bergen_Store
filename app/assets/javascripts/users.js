function sign_in_user()
{
	var username = $('#user_user_name').val();
	var password = $('#user_password').val();
	
	$.ajax({
	  type:'POST',
	  url:'/users/sign_in',
	  data: {my_data: {user_name: username, password: password}},
	  success:function(data) {
		$('#errors').text(data['error']);
		$('#errors').show();
	  }, error: function(jqXHR, textStatus, errorThrown){
		$('#errors').text(textStatus);
		$('#errors').show();
        console.log(errorThrown);
      }
    });
}
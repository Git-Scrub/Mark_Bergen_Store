function submit_new_user()
{
	var userName = $('#user_user_name').val(),
		password = $('#user_password').val(),
		first_name = $('#customer_first_name').val(),
		last_name = $('#customer_last_name').val(),
		email = $('#customer_email').val(),
		address = $('#customer_home_address').val(),
		city = $('#customer_city').val(),
		province = $('#customer_province_id').val();
		
	$.ajax({
	  type:'POST',
	  url:'/create_new_user',
	  data: {my_data: {user_name: userName, password: password, first_name: first_name, last_name: last_name, email: email, address: address, city: city, province: province}},
	  success:function(data) {
		console.log(data);
	    if(data && !data['error'])
		{
		  console.log(data)
		}
		else if(data['error'])
		{
			var errorMessage = getErrorMessage(data);
			$('#errors').text(errorMessage);
			$('#errors').show();
		}
		else
		{
			$('#errors').text("Something went wrong. No data recieved but success on Ajax call");
		}
	  }, error: function(jqXHR, textStatus, errorThrown){
		$('#errors').text(textStatus);
        console.log(errorThrown);
      }
    });
}

function getErrorMessage(data)
{
	var errorMessage = "";
	if(data['error']['user_name'])
	{
		errorMessage += "User name " + data['error']['user_name']
	}
	
	if(data['error']['password'])
	{
		errorMessage += "password " + data['error']['password']
	}
	
	if(data['error']['first_name'])
	{
		errorMessage += "first_name " + data['error']['first_name']
	}
	
	if(data['error']['last_name'])
	{
		errorMessage += "last_name " + data['error']['last_name']
	}
	
	if(data['error']['email'])
	{
		errorMessage += "email " + data['error']['email']
	}
	
	if(data['error']['home_address'])
	{
		errorMessage += "address " + data['error']['home_address']
	}
	
	if(data['error']['city'])
	{
		errorMessage += "city " + data['error']['city']
	}
	
	if(data['error']['province_id'])
	{
		errorMessage += "Province " + data['error']['province_id']
	}
	
	return errorMessage;
}
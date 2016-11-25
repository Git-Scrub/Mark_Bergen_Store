class UsersController < InheritedResources::Base
  def create
  end
  
  def sign_in
    user_name = params[:my_data][:user_name]
	password = params[:my_data][:password]
    if User.exists?(user_name: user_name, password: password) then
	  session[:user] = params[:my_data][:user_name]
	  redirect_to root_path
	else
	  render json: {error: "Invalid username or password."}
	end
  end
  
  private
    def user_params
      params.require(:user).permit(:user_name, :password)
    end
end


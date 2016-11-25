class UsersController < InheritedResources::Base
  def create
  end
  private
    def user_params
      params.require(:user).permit(:user_name, :password)
    end
end


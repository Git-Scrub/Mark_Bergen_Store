class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:user_name, :password)
    end
end


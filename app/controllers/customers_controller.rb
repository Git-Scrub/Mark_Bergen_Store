class CustomersController < InheritedResources::Base
    def index
	   @customers = Customer.all
	end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :home_address, :ip_address, :city)
    end
end


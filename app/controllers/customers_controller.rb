class CustomersController < InheritedResources::Base



  private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :home_address, :ip_address)
    end

end


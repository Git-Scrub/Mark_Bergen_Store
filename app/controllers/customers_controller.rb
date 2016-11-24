class CustomersController < InheritedResources::Base
    before_action :initialize_session
	before_action :increment_visit_count, only: [:index]
	
    def index
	   @customers = Customer.all
	end

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :home_address, :ip_address)
    end
	
	def initialize_session
	   session[:visit_count] ||= 0
	end
    def increment_visit_count
	   session[:visit_count] += 1
	   @visit_count = session[:visit_count]
	end
end


class CustomerProvince < ApplicationRecord
   belongs_to :customer
   belongs_to :province
end

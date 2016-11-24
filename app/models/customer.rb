class Customer < ApplicationRecord
   validates :first_name, :last_name, :email, :home_address, :province, presence: true, allow_blank: false
   validates_format_of :email, :with => /@/
   
   belongs_to :province
end

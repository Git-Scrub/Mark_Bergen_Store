class Customer < ApplicationRecord
   validates :first_name, :last_name, :email, :home_address, presence: true, allow_blank: false
   validates_format_of :email, :with => /@/
end

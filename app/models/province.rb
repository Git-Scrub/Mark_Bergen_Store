class Province < ApplicationRecord
   validates :name, :tax_rate, :province_code, presence: true, allow_blank: false
   
   validates_format_of :name, :with => /\A[a-zA-Z]*\Z/
   validates_format_of :province_code, :with => /\A[a-zA-Z]*\Z/
   validates_length_of :province_code, :is => 2
   
   has_many :customers
end

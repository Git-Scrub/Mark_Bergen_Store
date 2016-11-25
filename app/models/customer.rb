class Customer < ApplicationRecord
   validates :first_name, :last_name, :email, :home_address, :province, presence: true, allow_blank: false
   validates_format_of :email, :with => /@/
   
   belongs_to :province
   belongs_to :user
   has_many :orders
   
   def self.next_id_sequence
    ActiveRecord::Base.connection
                      .select_value('select last_value from Customer_id_seq')
                      .to_i
  end
end

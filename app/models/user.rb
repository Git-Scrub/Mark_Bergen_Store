class User < ApplicationRecord
  validates :user_name, :password, :customer, presence: true, allow_blank: false
  validates :user_name, :uniqueness => true, :length => { :in => 3..20 }
  validates_length_of :password, :in => 6..20, :on => :create
  validates_confirmation_of :password
  
  has_one :customer
  
  def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation, :customer)
  end
  
  def new
  end
end

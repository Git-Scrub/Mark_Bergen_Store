class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  
  has_and_belongs_to_many :catagories
  
  mount_uploader :image, ProductImageUploaderUploader
end

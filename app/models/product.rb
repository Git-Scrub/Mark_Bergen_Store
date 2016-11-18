class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  belongs_to :product_type
  
  mount_uploader :image, ProductImageUploaderUploader
end

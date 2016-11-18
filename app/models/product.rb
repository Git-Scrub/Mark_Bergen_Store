class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  
  #belongs_to :product_type
  has_many :product_product_types
  has_many :product_types, through: :product_product_types
  
  mount_uploader :image, ProductImageUploaderUploader
end

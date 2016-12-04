class Product < ApplicationRecord
  validates :name, :description, :price, presence: true

  has_and_belongs_to_many :catagories
  has_many :order_item_tables

  mount_uploader :image, ProductImageUploaderUploader
end

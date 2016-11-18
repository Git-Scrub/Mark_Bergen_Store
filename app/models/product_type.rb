class ProductType < ApplicationRecord
  validates :name, presence: true
  
  has_many :product_product_types
  has_many :products, through: :product_product_types
end

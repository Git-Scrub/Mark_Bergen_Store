class ProductProductType < ApplicationRecord
  belongs_to :product
  belongs_to :product_type
end

class CatagoriesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :catagory
end

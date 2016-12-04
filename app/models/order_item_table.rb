class OrderItemTable < ApplicationRecord
  validates :amount_ordered, :tax_rate_used, :price_per_item, presence: true
  belongs_to :product
  belongs_to :order
end

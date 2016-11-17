class About < ApplicationRecord
  validates :about_us_description, presence: true
end

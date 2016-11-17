class AboutValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "You should only have one Abouts description" if About.count > 0 || About.first == self;
  end
end

class About < ApplicationRecord
  validates :about_us_description, presence: true
  validates_with AboutValidator
end

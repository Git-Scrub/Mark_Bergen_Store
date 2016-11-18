class ContactInfoValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "You should only have one Contact us page description" if ContactInfo.count > 0 || ContactInfo.first == self;
  end
end

class ContactInfo < ApplicationRecord
  validates :contact_page_text, presence: true
  validates_with ContactInfoValidator
end

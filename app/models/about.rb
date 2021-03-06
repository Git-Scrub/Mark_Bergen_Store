class About < ApplicationRecord
  validates :about_us_description, presence: true
  validate :validate_allow_one_record_only

  def validate_allow_one_record_only
    max_records = new_record? ? 0 : 1
    errors[:base] << 'You should only have one Abouts description' if About.count > max_records
  end
end

class About < ApplicationRecord
  validates :about_us_description, presence: true
  
  private
  def there_can_only_be_one
    errors[:base] << 'There can only be one' if About.count > 0 || About.first == self;
  end
end

class Province < ApplicationRecord
  validates :name, :province_code, presence: true, allow_blank: false

  validates :name, format: { with: /\A[a-zA-Z ]*\Z/ }
  validates :province_code, format: { with: /\A[a-zA-Z]*\Z/ }
  validates :province_code, length: { is: 2 }

  has_many :customers

  after_initialize :init
  def init
    self.gst ||= 0.0
    self.pst ||= 0.0
    self.hst ||= 0.0

    self.gst = self.gst / 100 if self.gst > 1
    self.hst = self.hst / 100 if self.hst > 1
    self.pst = self.pst / 100 if self.pst > 1
  end
end

class Province < ApplicationRecord
   validates :name, :province_code, presence: true, allow_blank: false
   
   validates_format_of :name, :with => /\A[a-zA-Z ]*\Z/
   validates_format_of :province_code, :with => /\A[a-zA-Z]*\Z/
   validates_length_of :province_code, :is => 2
   
   has_many :customers
   
   after_initialize :init
   def init
     self.gst ||= 0.0
	 self.pst ||= 0.0
	 self.hst ||= 0.0
	 
	 if self.gst > 1
	   self.gst = self.gst / 100
	 end
	 if self.hst > 1
	   self.hst = self.hst / 100
	 end
	 if self.pst > 1
	   self.pst = self.pst / 100
	 end
   end
end

class Cliff < ActiveRecord::Base
	
	attr_accessible :name
	has_many :courses
	
	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
	def today
		Time.now.strftime("%Y-%m-%d")
	end
	def todays_courses
		self.courses.find_all_by_date(self.today, :order=>'time')
	end

end

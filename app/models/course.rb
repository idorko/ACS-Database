class Course < ActiveRecord::Base

					attr_accessible :client_ids, :guide_ids, :num_clients, :num_guides, :experience, :course_type, :date, :time, :contact

	has_and_belongs_to_many :clients, :join_table => 'clients_courses'
	has_and_belongs_to_many :guides, :join_table => 'courses_guides'
	belongs_to :cliff

	accepts_nested_attributes_for :clients

	validates :course_type, :presence => true
	validates :date, :presence => true
	validates :time, :presence => true

	def course_time
		self.time.strftime("%I:%M%p")
	end
	def course_date
		self.date.strftime("%m-%d-%Y")
	end
end

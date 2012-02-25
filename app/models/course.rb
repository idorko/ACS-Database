class Course < ActiveRecord::Base

					attr_accessible :client_ids, :guide_ids, :num_clients, :num_guides, :experience, :course_type, :date, :time, :contact

	has_and_belongs_to_many :clients, :join_table => 'clients_courses'
	has_and_belongs_to_many :guides, :join_table => 'courses_guides'
	belongs_to :cliff

	validates :num_clients, :presence => true
	validates :num_guides, :presence => true
	validates :course_type, :presence => true
	validates :date, :presence => true
	validates :time, :presence => true

end

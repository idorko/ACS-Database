class Course < ActiveRecord::Base

					attr_accessible :num_clients, :num_guides, :experience, :type, :date, :time, :contact

	belongs_to :client
	belongs_to :guide
	belongs_to :cliff

	validates :num_clients, :presence => true
	validates :num_guides, :presence => true
	validates :type, :presence => true
	validates :date, :presence => true
	validates :time, :presence => true

end
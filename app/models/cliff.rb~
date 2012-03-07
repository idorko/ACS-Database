class Cliff < ActiveRecord::Base
	
	attr_accessible :name
	has_many :courses
	
	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
end

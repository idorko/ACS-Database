class Guide < ActiveRecord::Base
	
	attr_accessible :name, :age, :email, :phonenum, :certifications
	has_many :clients, :through => :courses

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#phone_regex = ^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$

	validates :name, :presence => true,
									 :length => {:maximum => 50}
	validates :age, :presence => true
	validates :email, :presence => true,
										:format => {:with => email_regex},
										:uniqueness => {:case_sensitive => false}
	validates :phonenum, :presence => true
											 #:format => {:with => phone_regex}
end

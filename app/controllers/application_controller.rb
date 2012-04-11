class ApplicationController < ActionController::Base
	require 'ext/array'
	require 'will_paginate/array'  

	protect_from_forgery

	def today
		Time.now.strftime("%Y-%m-%d")
	end
end

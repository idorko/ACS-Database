module ApplicationHelper

	def title
		base_title = "Atlantic Climbing School Database"
		if @title.nil?
			base_title
		else
			 "#{base_title} | #{@title}"
		end
	end
end

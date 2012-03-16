module ApplicationHelper

	def title
		base_title = "Atlantic Climbing School Database"
		if @title.nil?
			base_title
		else
			 "#{base_title} | #{@title}"
		end
	end

	def unallocated_guides(half_day)
		#take an array of assigned guides and
		#determine which guides are still available.
		@guides = []
		half_day.each do |course|
			#generate list of assigned guides						
			course.guides.each do |guide|
			@guides << guide
			end
		end
		#generate list of unassigned guides
		@un_guides = Guide.all
			#remove assigned guides from all list
			for i in 0..@un_guides.length do
				@guides.each do |assigned_guide|
					if @un_guides[i] == assigned_guide 
						@un_guides[i] = nil
					end
				end
			end
		return @un_guides
	end


end

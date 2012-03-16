class PagesController < ApplicationController
  def home

		@days = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]
		@title = "Home"
		#find weeks worth of courses
		if params[:course]		
			@date = Time.new(params[:course][:"date(1i)"].to_i,params[:course][:"date(2i)"].to_i, params[:course][:"date(3i)"].to_i)
		end
		
		@dates = []
		if @date
			for i in 0..@date.wday 
				@dates << Time.new(params[:course][:"date(1i)"].to_i,params[:course][:"date(2i)"].to_i, params[:course][:"date(3i)"].to_i - i)
			end

			@index = 1

			for i in @date.wday..5
				@dates << Time.new(params[:course][:"date(1i)"].to_i,params[:course][:"date(2i)"].to_i, params[:course][:"date(3i)"].to_i + @index)
			@index = @index + 1		
			end
				@dates.sort!{|a,b| b.day <=> a.day }
				@dates.reverse!
		
			@week = [[[],[]],[[],[]],[[],[]],[[],[]],[[],[]],[[],[]],[[],[]]]
			@courses = []
			for i in 0..6 
				@courses = Course.find_all_by_date(@dates[i].strftime("%Y-%m-%d"), :order => 'time')
				@courses.each do |course| 
					if course.time.strftime("%I").to_i < 12
						@week[i][0] << course
					else
						@week[i][1] << course
					end
				end	
				@courses = []
			end
		end	
	end
end

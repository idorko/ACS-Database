class PagesController < ApplicationController
  def home
		@title = "Home"
		#find weeks worth of courses
		if params[:course]		
			@date = Date.civil(params[:course][:"date(1i)"].to_i,params[:course][:"date(2i)"].to_i, params[:course][:"date(3i)"].to_i)
		else
			@date = today
		end
  end
end

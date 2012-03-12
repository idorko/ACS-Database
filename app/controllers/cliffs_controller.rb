class CliffsController < ApplicationController
		
	def index
		@title = "All Cliffs"
		@cliffs = Cliff.all
	end
		
	def show
		@cliff = Cliff.find(params[:id])
		@courses = @cliff.courses
	end

	def new
		@cliff = Cliff.new
		@title = "New Cliff"
	end

	def create
		@cliff = Cliff.new(params[:cliff])
		if @cliff.save
			flash[:success] = "Cliff #{@cliff.name} Created!"
			redirect_to @cliff
		else
			@title = "New Cliff"
			render "new"
		end
	end

	def list_date
		@cliffs = Cliff.all
	end

	def destroy
		Cliff.find(params[:id]).destroy
		flash[:success] = "Cliff deleted."
		redirect_to cliffs_path
	end
end

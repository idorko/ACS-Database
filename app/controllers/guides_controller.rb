class GuidesController < ApplicationController
	
	def index
		@title = "All Guides"
		@guides = Guide.all
	end

	def show
		@guide = Guide.find(params[:id])
		@courses = @guide.courses
	end
	
	def new
		@guide = Guide.new		
		@title = "New Guide"
	end
	
	def create
		@guide = Guide.new(params[:guide])
		if @guide.save
			flash[:success] = "Guide #{@guide.first_name} Created!"
			redirect_to @guide
		else
			@title = "New Guide"
			render "new"
		end
	end

	def destroy
		Guide.find(params[:id]).destroy
		flash[:success] = "Guide deleted."
		redirect_to guides_path
	end
	
end

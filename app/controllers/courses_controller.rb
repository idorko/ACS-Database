class CoursesController < ApplicationController

	def index
		@title = "All Courses"
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
		@guides = Guide.all
		@clients = Client.all	
	end
	
	def new
		@course = Course.new		
		@title = "New Course"
		@guides = Guide.all
		@clients = Client.all
	end
	
	def edit
		@course = Course.find(params[:id])
		@title = "Edit Course"
		@guides = Guide.all
		@clients = Client.all
	end

	def update
		params[:course][:guide_ids] ||= []
		params[:course][:client_ids] ||= []
		@course = Course.find(params[:id])
		@guide = Guide.find(@course.num_guides)
		@client = Client.find(@course.num_clients)	
		@guide.courses << @course
		@client.courses << @course
		if @course.update_attributes(params[:course])
			flash[:notice]='Course Updated.'
			redirect_to @course
		else
			flash[:error]='Error Updating Course.'
			redirect_to @course
		end
	end

	def create

		@course = Course.new(params[:course])
		@guide = Guide.find(@course.num_guides)
		@client = Client.find(@course.num_clients)		
		@guide.courses << @course
		@client.courses << @course
		
		if @course.save
			flash[:success] = "Course Created!"
			redirect_to @course
		else
			@title = "New Course"
			render "new"
		end
	end	
	
end

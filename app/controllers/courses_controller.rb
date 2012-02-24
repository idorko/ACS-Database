class CoursesController < ApplicationController

	def index
		@title = "All Courses"
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
	end
	
	def new
		@course = Course.new		
		@title = "New Course"
	end
	
	def create
		@course = course.new(params[:course])
		if @course.save
			flash[:success] = "Course #{@course.name} Created!"
			redirect_to @course
		else
			@title = "New Course"
			render "new"
		end
	end	
	
	def edit
		@course = course.find(params[:id])
		@title = "Edit Course"
	end
end
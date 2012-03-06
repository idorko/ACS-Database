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
		@clients = Client.search(params[:search])
	end

	def update
		params[:course][:guide_ids] ||= []
		params[:course][:client_ids] ||= []
		@course = Course.find(params[:id])

		if (!params[:course][:num_guides].blank?)
			@guide = Guide.find(params[:course][:num_guides])
		end
		if (!params[:course][:num_clients].blank?)
			@client = Client.find(params[:course][:num_clients])	
		end

		if @course.update_attributes(params[:course])
			flash[:notice]="Course Updated."
			if @guide
				@guide.courses << @course
			end
			if @client	
				@client.courses << @course
			end
			redirect_to @course
		else
			flash[:error]="Error Updating Course."
			redirect_to @course
		end
	end

	def create

		@course = Course.new(params[:course])
		if (!params[:course][:num_guides].blank?)
			@guide = Guide.find(params[:course][:num_guides])
		end
		if (!params[:search].blank?)
			@client = Client.search(params[:search])			
		end
		
		if @course.save
			flash[:success] = "Course Created!"
			if @guide
				@guide.courses << @course
			end
			if @client	
				@client.courses << @course
			end
			redirect_to @course
		else
			@title = "New Course"
			render "new"
		end
	end	
	
end

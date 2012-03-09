class CoursesController < ApplicationController

	def index
		@title = "Courses"
		if params[:course]		
			@date = Date.civil(params[:course][:"date(1i)"].to_i,params[:course][:"date(2i)"].to_i, params[:course][:"date(3i)"].to_i)
		else
			@date = today
		end

		@courses = Course.find_all_by_date(@date, :order => 'time')
	end

	def show
		@course = Course.find(params[:id])
		@guides = Guide.all
		@clients = Client.all	
		if !@course.cliff.nil?
			@cliff = @course.cliff
		else
			@cliff = Cliff.new
		end
		
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
		if !@course.cliff.nil?
			@cliff = @course.cliff
		else
			@cliff = Cliff.new
		end
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
		if !params[:none][:cliff_id].blank?
			@cliff = Cliff.find(params[:none][:cliff_id])
		end

		if @course.update_attributes(params[:course])
			flash[:notice]="Course Updated."
			if @guide
				@guide.courses << @course
			end
			if @client	
				@client.courses << @course
			end
			if @cliff
				@cliff.courses << @course
			end
			redirect_to @course
		else
			flash[:error]="Error Updating Course."
			redirect_to @course
		end
	end

	def create
		@title = "Create Course"
		@course = Course.new(params[:course])

		if !params[:client_ids].blank?
			@clients = Client.find(params[:client_ids])
		else
			flash[:error] = "You must select at least one client."
			render 'new' and return
		end		

		if !params[:none][:cliff_id].blank?
			@cliff = Cliff.find(params[:none][:cliff_id])
		end

		if @course.save
			flash[:success] = "Course Created!"
			if @clients
				@clients.each do |client|	
					client.courses << @course
				end
			end
			if @cliff
				@cliff.courses << @course
			end
			redirect_to @course
		else
			flash[:error] = "Course creation failed."
			render 'clients/search'
		end
	end	
	
	def clients_selected
		@clients = Client.find(params[:client_ids])	
	end
end

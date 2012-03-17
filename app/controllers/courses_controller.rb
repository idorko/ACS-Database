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
		@guides = @course.guides.all
		@clients = @course.clients.all
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
			#check to see if guide has already been assigned to a course for that timeslot.
			@guide.courses.find_all_by_date(@course.course_date, :order => 'time').each do |course_item|
				if course_item.ampm == @course.ampm
					flash[:error]="#{@guide.name} has already been assigned to a course on #{@course.course_date}	at #{@course.course_time}."
					redirect_to edit_course_path
				end				
			end
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
			redirect_to edit_course_path
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

	def destroy
		Course.find(params[:id]).destroy
		flash[:success] = "Course deleted."
		redirect_to courses_path
	end
end

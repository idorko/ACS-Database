class GuidesController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@title = "All Guides"
		@guides = Guide.all.paginate(:page => params[:guide_page], :order => 'name ASC', :per_page => 10)
	end

	def show
		@guide = Guide.find(params[:id])
		@courses = @guide.courses.paginate(:page => params[:guide_page], :order => 'date ASC', :per_page => 10)
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

	def edit
		@guide = Guide.find(params[:id])
		@title = "Edit Guide"
	end

	def update
		@guide = Guide.find(params[:id])
		if @guide.update_attributes(params[:guide])
			flash[:notice]="#{@guide.name} Updated."
			redirect_to @guide
		else 
			flash[:error]="Error Updating #{@guide.name}."
			redirect_to @guide
		end	
	end
	

	def destroy
		Guide.find(params[:id]).destroy
		flash[:success] = "Guide deleted."
		redirect_to guides_path
	end
	
end

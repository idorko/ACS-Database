class GuidesController < ApplicationController
	def show
		@guide = Guide.find(params[:id])
	end
	
	def new
		@guide = Guide.new		
		@title = "New Guide"
	end
	
	def create
		@guide = Guide.new(params[:guide])
		if @guide.save
			flash[:success] = "Guide #{@guide.name} Created!"
			redirect_to @guide
		else
			@title = "New Guide"
			render "new"
		end
	end	
end

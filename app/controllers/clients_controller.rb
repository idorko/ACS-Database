class ClientsController < ApplicationController
	
	before_filter :authenticate_user!

	def index
		@title = "All Clients"
		@clients = Client.search(params[:search]).sort_by_name.paginate(:page => params[:page], :order => 'last_name ASC', :per_page => 10)

	end

	def show
		@guides = []
		@client = Client.find(params[:id])
		@courses = @client.courses.all.paginate(:page => params[:page], :order => 'date ASC', :per_page => 10)
	 	@courses.each do |course|
			course.guides.each do |guide|
				@guides << guide
			end
			@guides = @guides.paginate(:page => params[:guides_page], :per_page => 10)
		end
	end
	
	def new
		@client = Client.new		
		@title = "New Client"
	end
	
	def create
		@client = Client.new(params[:client])
		if @client.save
			flash[:success] = "Client #{@client.first_name+" "+@client.last_name} Created!"
			redirect_to @client
		else
			@title = "New Client"
			render "new"
		end
	end	
	
	def edit
		@client = Client.find(params[:id])
		@title = "Edit Client"
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(params[:client])
			flash[:notice]="#{@client.name} Updated."
			redirect_to @client
		else 
			flash[:error]="Error Updating #{@client.name}."
			redirect_to @client
		end	
	end
	
	def search
		@title = "Create Course"
		@course = Course.new()
		@clients = []
		if !params[:id].blank?
			@clients << Client.find(params[:id])
		end
		if !params[:search].blank?
			@clients = Client.search(params[:search])
		end
		if @clients.empty?
			flash[:error] = "Error: no matching clients found."
			render 'courses/new'
		end
		#@clients = Client.all	
	end
	
	def destroy
		Client.find(params[:id]).destroy
		flash[:success] = "Client deleted."
		redirect_to clients_path
	end
end

class ClientsController < ApplicationController
	
	def index
		@title = "All Clients"
		@clients = Client.all
	end

	def show
		@client = Client.find(params[:id])
	end
	
	def new
		@client = Client.new		
		@title = "New Client"
	end
	
	def create
		@client = Client.new(params[:client])
		if @client.save
			flash[:success] = "Client #{@client.name} Created!"
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
end
AcsDatabase::Application.routes.draw do

 	root :to => 'pages#home' 
	resources :clients, :guides, :courses, :cliffs	
	
	match '/clients', :to => 'clients#index'
	match '/courses', :to => 'courses#index'	

end

AcsDatabase::Application.routes.draw do
  get "courses/new"

 	root :to => 'pages#home' 
	resources :clients, :guides, :courses, :cliffs	
	
	match '/clients', :to => 'clients#index'
	

end

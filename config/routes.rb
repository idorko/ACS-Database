AcsDatabase::Application.routes.draw do

 	root :to => 'pages#home' 
	resources :cliffs
	resources :courses do
		resources :clients
		resources :guides
	end
	resources :clients do
		post 'search', :on => :collection
	end
	resources :guides
	match '/clients', :to => 'clients#index'
	match '/courses', :to => 'courses#index'	

end

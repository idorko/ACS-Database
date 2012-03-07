AcsDatabase::Application.routes.draw do

  get "sessions/new"

 	root :to => 'pages#home' 
	resources :cliffs
	resources :courses do
		post 'clients_selected', :on => :collection
		#resources :clients
		#resources :guides
	end
	resources :clients do
		post 'search', :on => :collection
	end

	resources :guides
	
	resources :sessions, :only => [:new, :create, :destroy]

	match '/clients', :to => 'clients#index'
	match '/courses', :to => 'courses#index'	
	match '/signin', :to => 'sessions#new'
	match '/signout', :to => 'sessions#destroy'

end

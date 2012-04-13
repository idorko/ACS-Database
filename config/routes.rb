AcsDatabase::Application.routes.draw do


  devise_for :users, :controllers => {:registrations => "registrations"}

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
	resources :users, :only => :show


	match '/clients', :to => 'clients#index'
	match '/courses', :to => 'courses#index'	
	match '/download', :to => 'clients#download'

end

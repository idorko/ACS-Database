AcsDatabase::Application.routes.draw do
  

	resources :clients, :guides, :courses, :cliffs	
	
	root :to => 'pages#home' 
	get "pages/home"	
end

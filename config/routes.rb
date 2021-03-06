Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
	
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  
  get 'mybook', to: 'items#mybook'
  resources :items, only: [:show, :edit, :update, :new]
  
  resources :ownerships, only: [:create, :destroy,]

end

Rails.application.routes.draw do
  get 'userfeatures/new'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  resources :userfeatures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

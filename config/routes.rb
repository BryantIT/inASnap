Rails.application.routes.draw do


  resources :sessions
  resources :users
  resources :photographers do
    resources :reviews, :only => [:create, :new, :index, :update]
  end
  resources :reviews, :only => [:show, :index, :update, :edit, :destroy]
  resources :photographers, :except => [:create, :edit, :delete]

  #devise_for :users, controllers: {omniauth_callbacks: 'user/omniauth_callbacks'}
  get 'welcome', to: 'static#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login_user'

  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/facebook', as: 'facebook_login'
  #get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  get '/users', to: 'photographers#index'
  post '/users/:id', to: 'photographers#index'

  delete '/logout', to: 'sessions#destroy'
=begin

    get '/photographer/:id', to: 'photographers#show'
    #get '/reviews/photographers/:id', to: 'photographers#show'

    get '/photographers/:photographer_id/reviews', to: 'photographers#show'
    post '/photographers/:photographer_id/reviews' => CREATE


    get '/reviews', to: 'reviews#index'
    get '/reviews/new', to: 'reviews#new'
    get '/reviews/:id', to: 'reviews#show', as: 'review'
    post '/reviews', to: 'reviews#create'


    get '/reviews/:id/edit', to: 'reviews#edit'
    patch 'reviews/:id', to: 'reviews#update'
=end

   # resources :users, only: [:index]
    #resources :photographers do
     # resources :reviews, only: [:new, :create, :index]
    #end
    #resources :reviews, only: [:index, :show, :new, :create, :edit, :update]


end

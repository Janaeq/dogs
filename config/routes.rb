Rails.application.routes.draw do
  root 'sessions#welcome'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete "logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :dogs do
    resources :walks, only: [:index, :new, :create] #dogs/:id/walks
  end

  resources :walkers do
    resources :comments, only: [:index, :new, :create] #walkers/:id/comments
  end

  resources :walks
  resources :comments
  resources :walkers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

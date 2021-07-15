Rails.application.routes.draw do
  root 'sessions#welcome'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete "logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get '/auth/:provider/callback' => 'sessions#omniauth'
  # REDIRECT USER IF AUTH FAILS
  get '/auth/failure', to: redirect('/')

  resources :dogs do
    resources :walks, only: [:index, :new, :create] #dogs/:id/walks
  end

  resources :walkers do
    resources :comments, only: [:index, :new, :create] #walkers/:id/comments
  end

  #walkers nested under users

  resources :users do
    resources :walkers, only: [:index]
  end

  resources :walks
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

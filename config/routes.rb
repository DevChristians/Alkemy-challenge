Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, skip: %i[registrations sessions passwords]

  devise_scope :user do
    post "signup", to: "registrations#create"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
  end

  resources :genres
  resources :characters

  resources :movies do 
    resources :movies_characters, only: [:index, :create, :destroy], path: "characters"
    resources :movies_genres, only: [:index, :create, :destroy], path: "genres"
  end

  resources :rspec_genres, controller: 'rspec/genres', path: 'rspec/genres'
  resources :rspec_characters, controller: 'rspec/characters', path: 'rspec/characters'
  
  resources :rspec_movies, controller: 'rspec/movies', path: "rspec/movies" do 
    resources :movies_characters, controller: 'rspec/movies_characters', only: [:index, :create, :destroy], path: "characters"
    resources :movies_genres, controller: 'rspec/movies_genres', only: [:index, :create, :destroy], path: "genres"
  end

end

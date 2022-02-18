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
end

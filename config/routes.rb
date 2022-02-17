Rails.application.routes.draw do
  resources :genres
  resources :characters

  resources :movies do 

    resources :movies_characters, only: [:index, :create, :destroy], path: "characters"

    resources :movies_genres, only: [:index, :create, :destroy], path: "genres"

  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

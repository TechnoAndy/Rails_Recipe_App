Rails.application.routes.draw do
  resources :inventory_foods
  resources :inventories
  resources :recipe_foods
  resources :foods
  resources :recipes
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

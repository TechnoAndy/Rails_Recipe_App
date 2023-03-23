Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'foods#index'

  resources :users
  resources :foods
  resources :inventories do 
    resources :inventory_foods
  end
  resources :recipes do
    resources :recipe_foods
    member do
      
    end
  end
  resources :shopping_lists

  get '/public_recipes', to: 'recipes#public_recipes'
  get '/about', to: 'recipes#about'
end

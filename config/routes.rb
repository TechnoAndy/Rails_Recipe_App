Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'foods#index'
 
  resources :users, only: [:edit]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :inventories, only: [:index, :show, :new, :create, :destroy, :update] do 
    resources :inventory_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :shopping_lists, only: [:index]

  get '/public_recipes', to: 'recipes#public_recipes'
  get '/about', to: 'recipes#about'
end

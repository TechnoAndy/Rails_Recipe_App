Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'foods#index'

  resources :users
  resources :foods 
  resources :recipes do #, only: [:index, :show, :new, :create, :destroy, :update]
    resources :recipe_foods #, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :inventories

  get '/public_recipes', to: 'recipes#public_recipes'

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root"application#index"
  resources :restaurants, only: [:index, :show] do
  	resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    get :feeds, :on => :collection
    get :experts, :on => :collection
    member do
      post :like
      post :unlike
    end
  end
  resources :categories, only: [:show]
  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  namespace :admin do
  	resources :restaurants
  	resources :categories
  end

end

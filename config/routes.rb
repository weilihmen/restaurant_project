Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root"restaurants#index"
  resources :restaurants
  namespace :admin do
  	resources :restaurants
  	resources :categories
  end

end

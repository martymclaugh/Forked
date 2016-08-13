Rails.application.routes.draw do
  get 'home/index'

  get 'home/profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'searches#index'
  resources :searches, only: [:new, :create, :index, :show]
  resources :recipes
end

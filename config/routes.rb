Rails.application.routes.draw do
  get 'users/show'

  get 'users/index'

  get 'users/new'

  # root 'searches#index'

  root 'home#index'

  # get 'home/index'

  get 'home/profile'

  get 'auth/:provider/callback', to: 'sessions#create'

  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :searches, only: [:new, :create, :index, :show]
  resources :recipes
end

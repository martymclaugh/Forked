Rails.application.routes.draw do
  # root 'searches#index'

  get '/' => 'recipes#home'
  get '/recipes/new' => 'recipes#new'
  get '/recipes/search' => 'recipes#search'
  get "/recipes/search_results" => 'recipes#search_results'
  get '/recipes/preview/:id' => 'recipes#preview'
  get '/recipes/:id' => 'recipes#show'

  get 'auth/:provider/callback', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes, :ingredients, :users
end

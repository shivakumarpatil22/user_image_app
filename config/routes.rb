Rails.application.routes.draw do
  resources :users
  post '/index' => 'users#index'
  get '/search' => 'users#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :profile
  end
  resources :contacts, only: [:new, :create]
  get '/about' => 'pages#about'
  get '/home' => 'pages#home'
  root 'pages#home'
end

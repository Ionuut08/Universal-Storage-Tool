Rails.application.routes.draw do
  devise_for :users, only: []

  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  delete 'logout', to: 'logins#logout'

  resources :users

  root 'logins#new'
end

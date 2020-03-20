Rails.application.routes.draw do
  devise_for :users, only: []

  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  delete 'logout', to: 'logins#logout'
  post 'logout', to: 'logins#logout'
  get 'download_file', to: 'files#download_file'


  resources :users
  resources :files

  root 'logins#new'
end

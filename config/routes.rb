Rails.application.routes.draw do
  devise_for :users, only: []

  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  delete 'logout', to: 'logins#logout'
  post 'logout', to: 'logins#logout'
  get 'download_file', to: 'files#download_file'
  get 'trash', to: 'users#trash'
  get 'restore', to: 'files#restore'
  get 'split_view', to: 'files#split_view'
  post 'split_file', to: 'files#split_file'
  get 'merge_view', to: 'files#merge_view'
  post 'merge_file', to: 'files#merge_file'


  resources :users
  resources :files

  root 'logins#new'
end

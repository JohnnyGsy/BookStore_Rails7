Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }, path_names: { edit: 'settings' }
  root 'pages#index'
  resources :books, only: %i[index show]
  resource :address, only: [:update]
  resources :reviews, only: [:create]
  resource :cart, only: %i[show update]
end

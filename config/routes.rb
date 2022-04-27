Rails.application.routes.draw do
  get 'book/index'
  get 'book/show'
  root 'pages#index'
  resources :books, only: [:index, :show]
end

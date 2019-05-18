Rails.application.routes.draw do
  get 'users/new'
  root 'pages#home'
  get 'signup', to: 'users#new'
  resources :users
end

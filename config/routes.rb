Rails.application.routes.draw do
  root 'pages#home'
  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'
  get '/edit',      to: 'users#edit'
  patch '/edit',    to: 'users#update'
  get '/login',     to:'sessions#new'
  post '/login',    to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get '/fp-signup', to: 'users#fp_new'
  get '/timesettings', to: 'time_settings#edit'
  patch '/timesettings', to: 'time_settings#update'
end

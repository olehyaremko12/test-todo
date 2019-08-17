Rails.application.routes.draw do
  resources :admins, only: %i[index]
  resources :todos
  resources :users, only: %i[create destroy]
  post '/auth/login', to: 'authentication#authenticate'
  post '/signup', to: 'users#create'
end

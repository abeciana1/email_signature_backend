Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/session-renew', to: 'users#session_renew'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

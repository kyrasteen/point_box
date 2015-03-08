Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :rewards do
    resources :user_rewards, only: [:show, :new,:create]
  end
  resources :users do
    resources :points, except: [:edit, :update]
  end
end

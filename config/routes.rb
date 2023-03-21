Rails.application.routes.draw do
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post '/guest_login', to: 'user_sessions#guest_login'
  get '/guest_login', to: 'user_sessions#guest_login'

  resources :users, only: %i[new create]
  resources :artists do
    resources :answers, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

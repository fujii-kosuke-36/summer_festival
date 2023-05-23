Rails.application.routes.draw do
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post '/guest_login', to: 'user_sessions#guest_login'
  

  resources :recommendations, only: %i[index]
  resources :festivals
  resources :users, only: %i[new create]
  resources :artists do
    resources :answers, only: %i[new create update destroy]
  end  
  resources :bookmarks, only: %i[index create destroy]
end

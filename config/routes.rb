Rails.application.routes.draw do
  root to: 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'

  post '/guest_login', to: 'user_sessions#guest_login'

  resources :recommendations, only: %i[index]
  resources :festivals
  resources :users, only: %i[new create]
  resources :artists do
    resources :answers, only: %i[new create update destroy]
  end
  resources :bookmarks, only: %i[index create destroy]
  resource :profile, only: %i[show edit update destroy]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update]

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'

    resources :artists do
      collection do
        get 'search'
      end
    end
  
    resources :festivals
  end
end

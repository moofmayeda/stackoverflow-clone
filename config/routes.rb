Rails.application.routes.draw do
  root :to => 'questions#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :questions, only: [:index]
  resources :users do
    resources :questions, except: [:index] do
      resources :responses
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
end

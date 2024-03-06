Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home/home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  namespace :admin do
    root 'dashboard#index'
    resources :users
    resources :categories
    resources :users
    resources :phalanges
    resources :libraries
    resources :songs
  end

  namespace :api do
    namespace :v1 do
      resources :phalanges
      resources :libraries
      resources :songs
    end
  end
end

Rails.application.routes.draw do


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
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home/home#index"
end

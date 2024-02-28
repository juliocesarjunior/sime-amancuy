Rails.application.routes.draw do
  
  devise_for :users, path: :account, path_names: {
    sign_in: 'entrar',
    sign_out: 'sair',
    password: 'secret',
    confirmation: 'verificar',
    unlock: 'desbloquear',
    #registration: 'minha-conta',
    sign_up: 'cadastre-se',
    edit: 'editar-perfil'
  }, controllers: { passwords: "passwords" }

  namespace :admin do
    get 'dashboard/index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home/home#index"
end

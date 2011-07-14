GerenciamentoDeIgrejas::Application.routes.draw do

  resources :membros do
    resources :nomeacoes
    member do
      get :desligamento
      post :desligar
    end
    member do
      get :novo_telefone
      post :add_telefone
    end
    member do
      get :transferencia
      post :transferir
    end
  end

  resources :filiais

  resources :ministerios

  resources :roles

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "usuarios#new", :as => "sign_up"
  resources :usuarios
  resources :sessions
  
  root :to => "sessions#new"
end

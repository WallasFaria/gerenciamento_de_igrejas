GerenciamentoDeIgrejas::Application.routes.draw do
 
  resources :filiais do
    resources :membros do
      resources :nomeacoes
      member do
        get :desligamento
        post :desligar
        get :novo_telefone
        post :add_telefone
        get :transferencia
        post :transferir
        get :historico
      end
    end
  end
  
  resources :ministerios

  resources :roles

  resources :usuarios

  resources :sessions

  get "home" => "home#show", :as => "home"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  
  root :to => "sessions#new"
end

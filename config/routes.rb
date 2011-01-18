Rbflow::Application.routes.draw do
  get "searches/index"

  match '/auth/:provider/callback', :to => 'authentications#create'
  match '/sign_in', :to => 'sessions#new'
  match '/sign_out', :to => 'sessions#destroy'
  
  resources :sessions, :only => [ :new, :destroy ]
  resources :pages, :only => :show
  resources :searches, :only => :index
  resources :users do
    member do
      put 'approve'
      put 'unapprove'
    end 
  end
  resources :items do
    resources :comments
  end
  
  root :to => "items#index"
end

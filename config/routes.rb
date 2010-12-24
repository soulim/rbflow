Rbflow::Application.routes.draw do
  match '/auth/:provider/callback', :to => 'authentications#create'
  match '/sign_in', :to => 'sessions#new'
  match '/sign_out', :to => 'sessions#destroy'
  
  resources :sessions, :only => [ :new, :destroy ]
  resources :users do
    member do
      put 'approve'
      put 'unapprove'
    end 
  end
  
  root :to => "sessions#new"
end

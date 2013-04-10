NewsRunner::Application.routes.draw do
  root to: 'newspapers#index'
  resources :users
  
  resources :newspapers do
    resource :subscription
  end
  
  resource :session, only: [:new, :create, :destroy]
  
end
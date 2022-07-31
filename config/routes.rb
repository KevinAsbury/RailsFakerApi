Rails.application.routes.draw do
  resources :communications
  resources :addresses
  resources :users

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
  post :signup, to: 'users#create'
  # root "articles#index"
end

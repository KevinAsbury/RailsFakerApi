Rails.application.routes.draw do
  resources :access_scopes
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  
  post "/graphql", to: "graphql#execute"

  resources :communications
  resources :addresses
  resources :users

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
  post :signup, to: 'users#create'
  # root "articles#index"
end

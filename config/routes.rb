Rails.application.routes.draw do

  # global options responder -> makes sure OPTION request for CORS endpoints work
  match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}

  resources :users, only: [:create, :update]
  
  resources :surveys, only: [:create]

  resources :questions, only: [:create]

  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :filters
  get "search", to:"search#index", as: "search"
  post "search/suggestions", to: "search#suggestions", as: "search_suggestions"
  root "products#index"
  resources :filters
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Defines the root path route ("/")
  # root "posts#index"
end

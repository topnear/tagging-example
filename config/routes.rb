TaggingExample::Application.routes.draw do
  resources :articles
  root "articles#index"
  get "/", to: "article#index", as: :tag
end

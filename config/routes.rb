Rails.application.routes.draw do

  resources :volunteers
  resources :customers
  resources :orders
  resources :donations
  resources :donors

  root to: 'welcome#index'

  get "/pages/:page" => "pages#show"

  get "*path" => redirect("/")
end

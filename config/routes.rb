Rails.application.routes.draw do

  resources :volunteers
  resources :customers
  resources :orders
  resources :donations

  root to: 'welcome#index'
  get "*path" => redirect("/")
end

Rails.application.routes.draw do

  resources :volunteers
  resources :customers
  resources :orders
  resources :donations

  root 'welcome#index'
end

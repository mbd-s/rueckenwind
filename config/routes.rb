Rails.application.routes.draw do

  resources :volunteers
  resources :customers
  resources :orders

  root 'welcome#index'
end

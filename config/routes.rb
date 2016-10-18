Rails.application.routes.draw do

  resources :volunteers
  resources :customers
  resources :orders
  resources :donations
  resources :donors
  resources :events

  root to: 'welcome#index'

  get "/pages/:page" => "pages#show"

  get "/confirm/:token" => "customers#confirm"

  get "*path" => redirect("/")
end

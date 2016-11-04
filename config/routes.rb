Rails.application.routes.draw do

  devise_for :users
  resources :volunteers
  resources :customers
  resources :orders
  resources :donations
  resources :donors
  resources :events

  root to: 'welcome#index'

  get "/sign_up/:role" => "devise#session"

  get "/pages/:page" => "pages#show"

  get "/confirm/:token" => "customers#confirm"

  get "*path" => redirect("/")
end

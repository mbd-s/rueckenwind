Rails.application.routes.draw do

  devise_for :users
  resources :users, except: :create
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

  post 'create_user' => 'users#create', as: :create_user

  # get "*path" => redirect("/")
end

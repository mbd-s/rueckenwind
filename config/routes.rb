# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, except: :create
  resources :customers
  resources :orders do
    member do
      get 'confirm', as: :confirm_invitation
      get 'decline', as: :decline_invitation
      get 'cancel', as: :cancel
    end
  end
  resources :donations
  resources :donors
  resources :events do
    member do
      get 'add_customer'
      post 'save_customer'
      get 'send_invitations'
      get 'add_volunteer'
    end
  end

  root to: 'welcome#index'

  get 'sign_up/:role' => 'devise#session'

  get 'pages/:page' => 'pages#show', as: :confirmation_page

  get 'confirm/:token' => 'customers#confirm'

  post 'create_user' => 'users#create', as: :create_user

  # get '*path' => redirect('/')
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  get "tos", to: "home#tos"
  get "policy", to: "home#policy"

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
  }
  authenticated do
    root "secret#index", as: :authenticated_root
  end
  resources :anger_records, except: [:index, :show, :edit]
  resources :success_records, except: [:index, :show, :edit]
  resources :calendars, only: [:index, :show], param: :date do
    resources :anger_records, only: :update
    resources :success_records, only: :update
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

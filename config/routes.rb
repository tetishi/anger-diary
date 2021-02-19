# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
  }
  authenticated do
    root "secret#index", as: :authenticated_root
  end
  resources :anger_records, except: :index
  resources :success_records, except: [:index, :edit]
  resources :calendars, only: [:index, :show, :update], param: :date do
    # resources :anger_records, only: :edit
    resources :anger_records, only: :update
    # resources :success_records, only: :update

    # member do
    #   PATCH :anger_records,
    #   PUT :anger_records
    # end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

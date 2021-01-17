# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  authenticated do
    root "secret#index", as: :authenticated_root
  end
  resources :anger_records, except: :index
  resources :success_records, except: :index
  resources :calendars, only: :index, param: :date
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

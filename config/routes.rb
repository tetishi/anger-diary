# frozen_string_literal: true

Rails.application.routes.draw do
  resources :anger_records
  resources :success_records
  resources :calendars, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

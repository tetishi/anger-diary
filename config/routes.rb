# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :anger_records, except: [:index, :delete]
  resources :success_records, except: [:index, :delete]
  resources :calendars, except: [:new, :create], param: :date
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  resources :anger_records, except: :index, param: :date
  resources :success_records, except: :index, param: :date
  resources :calendars, except: [:new, :create], param: :date
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

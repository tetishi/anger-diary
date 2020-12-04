# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"
  resources :anger_records, except: :index
  resources :success_records, except: :index
  resources :calendars, except: [:new, :create], param: :date do
    member do
      get "edit"
      patch "edit"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

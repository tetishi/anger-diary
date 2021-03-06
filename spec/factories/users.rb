# frozen_string_literal: true

require "faker"
require "forgery_ja"

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    confirmed_at { Faker::Date.in_date_period }
  end
end

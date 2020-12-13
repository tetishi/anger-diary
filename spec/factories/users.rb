# frozen_string_literal: true

require "faker"
require "forgery_ja"

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password(min_length: 6) }
  end
end

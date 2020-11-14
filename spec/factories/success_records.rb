# frozen_string_literal: true

require "faker"
require "forgery_ja"

FactoryBot.define do
  factory :success_record do
    body { Faker::Lorem.sentence }
  end
end

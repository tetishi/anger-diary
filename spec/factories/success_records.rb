# frozen_string_literal: true

require "faker"
require "forgery_ja"

FactoryBot.define do
  factory :success_record do
    success_body { Faker::Lorem.sentence }
    succeeded_on { Date.today }
  end
end

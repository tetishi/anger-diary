# frozen_string_literal: true

FactoryBot.define do
  factory :success_record do
    body { "MyText" }
    succeed_at { "2020-11-11" }
  end
end

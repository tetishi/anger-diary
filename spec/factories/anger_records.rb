# frozen_string_literal: true

require "faker"
require "forgery_ja"

FactoryBot.define do
  factory :anger_record, class: AngerRecord do
    level { Faker::Number.between(from: 1, to: 10) }
    got_angry_on { Faker::Date.in_date_period }
    got_angry_at { Faker::Time.forward(days: 11, period: :morning) }
    place { Faker::Lorem.words }
    body { Faker::Lorem.sentence }
    changeable { "Yes" }
    important { "Yes" }
  end
end

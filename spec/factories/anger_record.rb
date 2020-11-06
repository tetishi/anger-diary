require 'faker'
require 'forgery_ja'

FactoryBot.define do
  factory :anger_record do
    level { Faker::Number.between(from: 1, to: 10) }
    got_angry_at { Faker::Time }
    place { Faker::Lorem.words }
    body { Faker::Lorem.sentence }
    changeable { "Yes" }
    important { "No" }
  end
end

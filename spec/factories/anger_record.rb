require 'faker'
require 'forgery_ja'

FactoryBot.define do
  factory :anger_record do
    name { ForgeryJa(:name).full_name }
    name_kana { ForgeryJa(:name).full_name(to: ForgeryJa::KANA) }
    zip_code { Faker::Number.number(digits: 7).to_s }
    code { Faker::Lorem.characters(number: 20) }
    sex { Faker::Number.between(from: 0, to: 2) }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11)) }
    email { ForgeryJa('email').address }
  end
end

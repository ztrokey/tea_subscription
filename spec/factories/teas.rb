FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Tea.variety }
    temperature { Faker::Number.within(range: 175..212) }
    brew_time { Faker::Number.within(range: 1..5) }
  end
end

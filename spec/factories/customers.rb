FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name}
    email { Faker::Internet.email}
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip { Faker::Address.zip }
  end
end

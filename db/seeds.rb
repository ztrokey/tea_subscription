# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all

10.times do
  Tea.create!(name: Faker::Tea.variety,
              description: Faker::Tea.variety,
              temperature: Faker::Number.within(range: 175..212),
              brew_time: Faker::Number.within(range: 1..5))
end

20.times do
  customer = Customer.create!(first_name: Faker::Name.first_name,
                              last_name: Faker::Name.last_name,
                              email: Faker::Internet.unique.email,
                              street_address: Faker::Address.street_address,
                              city: Faker::Address.city,
                              state: Faker::Address.state_abbr,
                              zip: Faker::Address.zip)

  rand(1..10).times do
    customer.subscriptions.create!(title: Faker::Lorem.sentence(word_count: 3),
                                   price: Faker::Commerce.price(range: 5.0..40.0),
                                   status: %i[canceled active pending].sample,
                                   frequency: %i[weekly monthly quarterly].sample,
                                   tea_id: Tea.find(Tea.ids.sample).id)
  end
end

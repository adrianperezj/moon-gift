# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "-------------------------------------------"
puts "Creating events... Sit tight motherf*cker!"
puts "-------------------------------------------"
2.times do
  Event.create!(
  name: Faker::Lorem.word,
  date: Faker::Date.forward(days: 30),
  code: Faker::Alphanumeric.unique.alpha(number: 6),
  user_id: User.pluck(:id).sample
)
end
puts "-------------------------------------------"
puts "Done with your events, you lazy bastard!"
puts "-------------------------------------------"
puts "Creating 100 gifts...Sit tight motherf*cker!"
20.times do
  Gift.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 10..100),
    event_id: Event.pluck(:id).sample
  )
end
puts "-------------------------------------------"
puts "Done with your gifts, you lazy bastard!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy all"
Spot.destroy_all



puts "Creating Spot"

user_id = 1

10.times do
  Spot.create( name: Faker::Name.name, description: Faker::BackToTheFuture.quote, geocoding: Faker::Business.credit_card_number, user_id: user_id)

  user_id += 1
end

puts "Spots created"

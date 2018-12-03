# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroy all"
Spot.destroy_all
User.destroy_all


# Seeding users
puts "Creating users"
User.create(name: "Sophie")
User.create(name: "Brian")
User.create(name: "Florent")
User.create(name: "Seb")
puts "Users created"

# Seeding spots
# skateparks, bowls, pools,pyramids, ramps, slopes, rails, ledges, stairs
puts "Creating spots"
spot1 = Spot.create(name: "Jinqiao Skatepark", description: "Small concrete park with open bowl and street section.", user_id: 1, address: "上海长宁区娄山关路35号")
spot2 = Spot.create(name: "Top Toys Skatepark", description: "Small prefab street setup, its free.", user_id: 1, address: "上海长宁区凯旋路851号")
Spot.create(name: "Icon X Skatepark", description: "Wooden indoor park in Shanghai with fun looking street area with all the usual and a nice looking mini ramp.", address: "Shanghai loushanguanlu 35", user_id: 2)
Spot.create(name: "Middle Longhua Road Skate", description: "A nice wide open concrete skatepark with plenty of room to session all obstacles.", user_id: 3)
Spot.create(name: "Shanghai Skate Park", description: "This park is simply amazing! Its fukn huge and not just in area but sheer size.", user_id: 4)
puts "Spots created"
# Adding tags to spots

puts "Adding tags"
spot1.tag_list.add("skateparks")
spot1.save
spot2.tag_list.add("skateparks", "pyramids", "ramps")
spot2.save
puts "Tags added"

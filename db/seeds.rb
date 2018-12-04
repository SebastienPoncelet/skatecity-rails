# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroy everything"
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

u1 = User.all.first.id
u2 = User.all.first.id + 1
u3 = User.all.first.id + 2
u4 = User.all.first.id + 3

spot1 = Spot.create(name: "Jinqiao Skatepark", description: "Small concrete park with open bowl and street section.", user_id: u1, address: "上海长宁区娄山关路35号")
spot2 = Spot.create(name: "Top Toys Skatepark", description: "Small prefab street setup, its free.", user_id: u1, address: "上海长宁区凯旋路851号")
Spot.create(name: "Icon X Skatepark", description: "Wooden indoor park in Shanghai with fun looking street area with all the usual and a nice looking mini ramp.", user_id: u2, address: "")
Spot.create(name: "Middle Longhua Road Skate", description: "A nice wide open concrete skatepark with plenty of room to session all obstacles.", user_id: u3, address: "")
Spot.create(name: "Shanghai Skate Park", description: "This park is simply amazing! Its fukn huge and not just in area but sheer size.", user_id: u4, address: "")

puts "Spots created"

puts "creating image"
Image.create(user_id:1, spot_id:1, url:"feqq" )
Image.create(user_id:2, spot_id:2, url:"feqq" )
Image.create(user_id:3, spot_id:3, url:"feqq" )
Image.create(user_id:4, spot_id:4, url:"feqq" )
Image.create(user_id:5, spot_id:5, url:"feqq" )
puts "image created"

# Adding tags to spots
puts "Adding tags"
spot1.tag_list.add("skateparks")
spot1.save
spot2.tag_list.add("skateparks", "pyramids", "ramps")
spot2.save
puts "Tags added"

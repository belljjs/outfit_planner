# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'date'

Item.delete_all
Category.delete_all
Season.delete_all
Color.delete_all
Occasion.delete_all
Weather.delete_all
Outfit.delete_all
User.delete_all



# ____________________________________________________________________________



c = Category.create( name: "Top" )
c = Category.create( name: "Bottom" )
c = Category.create( name: "Dress" )
c = Category.create( name: "Shoes" )
c = Category.create( name: "Bag" )

categories = Category.all

puts Cowsay.say "Created #{categories.count} categories", :tux

# ____________________________________________________________________________


Season.create( name: "Summer" )
Season.create( name: "Winter" )
Season.create( name: "SpringFall" )
Season.create( name: "FourSeason" )

seasons = Season.all

puts Cowsay.say "Created #{seasons.count} seasons", :tux

# ____________________________________________________________________________


Color.create( name: "White" )
Color.create( name: "Grey" )
Color.create( name: "Black")
Color.create( name: "Blue" )
Color.create( name: "Beige" )
Color.create( name: "Red")
Color.create( name: "Green")
Color.create( name: "Yellow")

colors = Color.all

puts Cowsay.say "Created #{colors.count} colors", :tux

# ______________________________________________________________________________


Occasion.create( name: "Casual" )
Occasion.create( name: "Formal")
Occasion.create( name: "Exercise" )
occasions = Occasion.all

puts Cowsay.say "Created #{occasions.count} occasions", :tux



# ______________________________________________________________________________

PASSWORD = "aaa"

super_user = User.create(
  first_name: "Jessie",
  last_name: "Jung",
  email: "js@gmail.com",
  password: PASSWORD,
)

# 3.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name

#   User.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
#     password: PASSWORD
#   )
# end

users = User.all

puts Cowsay.say "Created #{users.count} users", :tux



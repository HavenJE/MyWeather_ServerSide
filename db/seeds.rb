# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.string :title
# t.string :content
# t.string :username
# t.string :category

# Could add more:
# t.integer :temperature
# t.integer :precipitation
# t.integer :humidity
# t.integer :wind

# The bang operator ! is used after create! to avoid returning null if its not able to create a user, so it would instead, return an exception or an error. 

# l1 = Location.create!(title: 'Oreilly', content: 'Oreilly is located on Queenslands border with New South Wales on the elevated Lamington Plateau. The plateau remains heavily vegetated by Gondwana Rainforests.', user_id: 'Jeff', category: 'Light rain showers')

u1 = User.create!(username: 'Jeff', email: 'swimhj_81@yahoo.com', password: 'Jeff@1981')

u1.locations.create!(title: 'Oreilly', content: 'Oreilly is located on Queenslands border with New South Wales on the elevated Lamington Plateau. The plateau remains heavily vegetated by Gondwana Rainforests.', category: 'Light rain showers')


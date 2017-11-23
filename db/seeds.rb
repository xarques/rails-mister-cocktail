# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

buffer = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
result = JSON.parse(buffer)

result["drinks"].each do |drink|
  puts (drink)
  ingredient = Ingredient.new
  ingredient.name = drink["strIngredient1"]
  ingredient.save
  puts("Add ingredient #{drink["strIngredient1"]}")
end

puts "Done ..."

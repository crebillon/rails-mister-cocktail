require 'json'
require 'open-uri'

puts "Deleting old database"
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)

puts 'Creating ingredients...'
drinks["drinks"].each do |ing|
  Ingredient.create!(name: ing["strIngredient1"])
end

puts 'Finished!'

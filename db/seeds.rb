# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Recipe.delete_all
Ingredient.delete_all
UserRecipe.delete_all
RecipeIngredient.delete_all
UserIngredient.delete_all
10.times do
  User.create(provider: "Facebook", uid: Faker::PhoneNumber.phone_number, name: Faker::Name.name)
end

100.times do
  Recipe.create(title: Faker::Pokemon.name, steps: ["do something", "do something a second time", "do something a third time for three times as long", "this is the fourth step"], spoon_id: Faker::PhoneNumber.phone_number, cuisine: ["American", "Chinese", "French", "Mexican"].sample, course: ["main dish", "side dish", "dessert", "appetizer"].sample, image: Faker::Avatar.image)
end

500.times do
  Ingredient.create(name: Faker::SlackEmoji.food_and_drink, image: Faker::Avatar.image, spoon_id: Faker::PhoneNumber.phone_number)
end

100.times do
  UserRecipe.create(user_id: rand(1...10), recipe_id: rand(1...100))
end

500.times do
  UserIngredient.create(user_id: rand(1...10), ingredient_id: rand(1...500))
end

500.times do
  RecipeIngredient.create(recipe_id: rand(1...100), ingredient_id: rand(1...500))
end

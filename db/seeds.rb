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
50.times do
  User.create(provider: "Facebook", uid: Faker::PhoneNumber.phone_number, name: Faker::Name.name)
end

i=1
50.times do
  user_ids =(1..50).to_a
  4.times do
    user_ids.delete(i)
    idx = user_ids.sample
    Friendship.create(user_id: i, friend_id: idx)
    Friendship.create(user_id: idx, friend_id: i)
    user_ids.delete(idx)
  end
  i += 1
end

100.times do
  Ingredient.create(name: Faker::Food.ingredient)
end

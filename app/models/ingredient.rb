class Ingredient < ApplicationRecord
  has_many :user_ingredients, foreign_key: :ingredient_id
  has_many :recipe_ingredients, foreign_key: :ingredient_id
  has_many :users, through: :user_ingredients, foreign_key: :user_id
  has_many :recipes, through: :recipe_ingredients, foreign_key: :recipe_id
end

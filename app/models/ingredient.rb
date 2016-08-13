class Ingredient < ApplicationRecord
  has_many :user_ingredients, foreign_key: :ingredient_id
  has_many :recipe_ingredients, foreign_key: :ingredient_id
  has many :users, through: :user_ingredients, foreign_key: :ingredient_id
  has many :recipes, through: :recipe_ingredients, foreign_key: :ingredient_id
end

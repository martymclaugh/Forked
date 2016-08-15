class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  validates :ingredient_id, uniqueness: { scope: :user_id,
    message: "You already have this ingredient in your fridge" }
end
n

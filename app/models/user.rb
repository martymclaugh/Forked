class User < ApplicationRecord
  has_many :user_ingredients
  has_many :user_recipes
  has_many :ingredients, through: :user_ingredients, foreign_key: :ingredient_id
  has_many :recipes, through: :user_recipes, foreign_key: :recipe_id
  has_many :likes
  has_many :makes

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name'],
      img_url: auth['info']['image']
    )
  end


end

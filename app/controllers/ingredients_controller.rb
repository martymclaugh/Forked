class IngredientsController < ApplicationController
  def create
    search_ingredients(params[:ingredient][:ingredient])
    @ingredient = Ingredient.new(name: ingredient[0]["name"], spoon_id: ingredient[0]["id"], image: ingredient[0]["image"])
    if @ingredient.save
      @useringredient = UserIngredient.create(user_id: current_user.id, ingredient_id: @ingredient.id)
    end
  end

  private

  def search_ingredients(ingredient)
    ingredient = HTTParty.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/parseIngredients",
    headers:{
      "X-Mashape-Key" => ENV['SPOON_KEY']
      "Content-Type" => "application/x-www-form-urlencoded"
    },
    parameters:{
      "ingredientList" => ingredient,
      "servings" => 1
    }
  end
end

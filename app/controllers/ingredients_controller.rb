class IngredientsController < ApplicationController

  def create
    search = search_ingredients
    ingredient = Ingredient.find_or_create_by(name: search[0]["name"], spoon_id: search[0]["id"], image: search[0]["image"])
    if ingredient.valid?
      @useringredient = UserIngredient.find_or_create_by(user_id: current_user.id, ingredient_id: ingredient.id)
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to user_path(current_user)
  end

  private

  def search_ingredients
    ingredient = HTTParty.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/parseIngredients",
    headers:{
      "X-Mashape-Key" => ENV['SPOON_KEY'],
       "Content-Type" => "application/x-www-form-urlencoded"
    },
    query:{
      "ingredientList" => params[:ingredient][:ingredient],
      "servings" => 1
    }
  end

end

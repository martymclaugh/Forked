class RecipesController < ApplicationController
  helper_method :search

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(spoon_id: params['recipe']['spoon_id'])
    if @recipe.save
      @user_recipe = UserRecipe.create(recipe_id: @recipe.id, user_id: current_user.id )
    end
  end

  def home
      if current_user
        @ingredient_array = []
        current_user.ingredients.all.map{|ingredient| @ingredient_array << ingredient.name}
        p @ingredient_array
      else
        sample_ingredients = [chocolate, broccoli, milk, cheddar, steak, bacon, beans, apples, cabbage, lettuce, shrimp, tempeh, macaroni, spaghetti, mushroom, carrot, onion, flour, butter, oil]
        p @ingredient_array << sample_ingredients.sample
      end
    p @recipe_of_the_day.class
    p @recipes.class
    @recipes = populate_initial(@ingredient_array)
    @recipe_of_the_day = search_recipe(rand(100000..800000))
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def preview
    @recipe = search_recipe(params[:id])
    @ingredients = search_ingredient(params[:id])
  end

  def search_results
    @recipes = search
  end

  private

  def populate_initial(ingredients)

    @ingredients = ingredients.split(" ").join(",").to_s
    @ingredients
    parameters = {
     "fillIngredients" => false,
     "includeIngredients" => @ingredients,
     "imitLicense" => false,
     "offset" => 0,
     "ranking" => 2,
     "number" => 25
   }
   headers = {
     "Accept" => "application/json",
     "X-Mashape-Key" => ENV['SPOON_KEY']
   }

   response = HTTParty.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/searchComplex",
              query: parameters,
              headers: headers )

   p response['results']
  end

  def search

    @ingredients = params[:ingredients].split(" ").join(",").to_s
    @ingredients
    parameters = {
     "fillIngredients" => false,
     "includeIngredients" => @ingredients,
     "intolerances" => params[:allergies],
     "cuisine" => params[:cuisine],
     "type" => params[:course],
     "imitLicense" => false,
     "excludeIngredients" => "eggs",
     "offset" => 0,
     "ranking" => 2,
     "query" => params[:query],
     "number" => 25
   }
   headers = {
     "Accept" => "application/json",
     "X-Mashape-Key" => ENV['SPOON_KEY']
   }

   response = HTTParty.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/searchComplex",
              query: parameters,
              headers: headers )

  p response['results']
  end

  def search_recipe(id)
    headers = {
      "Accept" => "application/json",
      "X-Mashape-Key" => ENV['SPOON_KEY']
    }
    # id = {"id" => id.to_i}
    response = HTTParty.get( "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id.to_i}/analyzedInstructions?stepBreakdown=true",
              #  query: parameters,
               headers: headers )
    pp response[0]['steps']
  end

  def search_ingredient(id)
    headers = {
      "Accept" => "application/json",
      "X-Mashape-Key" => ENV['SPOON_KEY']
    }
    # id = {"id" => id.to_i}
    response = HTTParty.get( "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id.to_i}/information",
              #  query: parameters,
               headers: headers )
    pp response
  end

end

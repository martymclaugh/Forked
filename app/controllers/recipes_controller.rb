class RecipesController < ApplicationController
  helper_method :search

  def index
    @recipe = Recipe.all
  end

  def create
    @recipe = Recipe.new(spoon_id: params['recipe']['spoon_id'])
    if @recipe.save
      @user_recipe = UserRecipe.create(recipe_id: @recipe.id, user_id: current_user.id )
    end
  end

  def home
      if current_user.ingredients.count > 5
        @ingredient_array = []
        current_user.ingredients.each{|ingredient| @ingredient_array << ingredient.name}
        puts "logged in"
        p @ingredient_array
      else
        @ingredient_array= []
        sample_ingredients = ["chocolate", "broccoli", "milk", "cheddar", "steak", "bacon", "beans", "apples", "cabbage", "lettuce", "shrimp", "tempeh", "macaroni", "spaghetti", "mushroom", "carrot", "onion", "flour", "butter", "oil"]
        5.times{@ingredient_array << sample_ingredients.sample}
        @ingredient_array
      end
    puts "***recipes***" *5
    pp @recipes = populate_initial(@ingredient_array)
    p @recipes.class
    puts "***recipe of the day***" *5
    p @recipe_of_the_day = search_recipe(@recipes.pop["id"])
    # @recipe_of_the_day = search_recipe(rand(100000..800000)) #This is working
    p @recipe_of_the_day.class
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

    @ingredients = ingredients.join(",").to_s
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
   puts "inside of populate_initial"
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
    pp response
    # pp response[0]['steps']
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

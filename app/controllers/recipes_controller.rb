class RecipesController < ApplicationController
  helper_method :search

  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    if params['ingredients']['id'].present?
      @recipe = Recipe.new(spoon_id: params['ingredients']['id'], title: params['ingredients']["title"], image: params['ingredients']['image'])
      if @recipe.save
        @user_recipe = UserRecipe.create(recipe_id: @recipe.id, user_id: current_user.id )
        redirect_to "/recipes/preview/#{@recipe.spoon_id}"
        add_score(current_user.id, 25)
      end
    else
      @recipe = Recipe.create(title: params[:recipe][:title], cooktime: params[:recipe][:cooktime], cuisine: params[:cuisine], course: params[:recipe][:course])
      @user_recipe = UserRecipe.create(recipe_id: @recipe.id, user_id: params[:recipe][:user_id])
      @steps = params[:steps].split("\r\n")
      @ingredients = params[:ingredients].split(',')
      @steps.each_with_index do |step, index|
        number = index + 1
        Step.create(step_number: number, recipe_id: @recipe.id, step_text: step)
      end
      @ingredients.each do |ingredient|
        this_ingredient = Ingredient.find_or_create_by(name: ingredient)
        RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: this_ingredient.id)
      end
      redirect_to recipe_path(@recipe)
      add_score(current_user.id, 300)
    end
  end

  def home
      if logged_in? && current_user.ingredients.count > 5
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
    @recipes = populate_initial(@ingredient_array)
    @recipe_of_the_day = @recipes.pop
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

   response['results']
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

  response['results']
  end

  def search_recipe(id)
    headers = {
      "Accept" => "application/json",
      "X-Mashape-Key" => ENV['SPOON_KEY']
    }
    response = HTTParty.get( "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id.to_i}/analyzedInstructions?stepBreakdown=true",
               headers: headers )

    # pp response
    if response.parsed_response.length == 0
      redirect_to "/"
    elsif response[0].has_key?("steps")
        response[0]["steps"]
    else
      @error = "*sorry try again later"
    end
  end

  def search_ingredient(id)
    headers = {
      "Accept" => "application/json",
      "X-Mashape-Key" => ENV['SPOON_KEY']
    }
    response = HTTParty.get( "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id.to_i}/information",
               headers: headers )
  end

end

class ApplicationController < ActionController::Base
  require "pp"
  protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :search
  headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'

  private

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

  def current_user

    if session[:user_id]
     @current_user ||=  User.find(session[:user_id])
    end
  end

  helper_method :current_user

end

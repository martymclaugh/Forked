class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :search

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
     "number" => 3,
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
  p response#['results'].map{|r| p r['title']}
  end
end

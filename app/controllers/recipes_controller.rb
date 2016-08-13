class RecipesController < ApplicationController
  def show
    @recipe = search_recipe(params[:id])
    @ingredients = search_ingredient(params[:id])
    json_data = { recipe: @recipe, ingredients: @ingredients}
    render :json => json_data
  end
end

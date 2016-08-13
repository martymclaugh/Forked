class RecipesController < ApplicationController
  def show
    @recipe = search_recipe(params[:id])
    @ingredients = search_ingredient(params[:id])
  end
end

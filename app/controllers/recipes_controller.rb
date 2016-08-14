class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def recipe_preview
    @recipe = search_recipe(params[:id])
    @ingredients = search_ingredient(params[:id])
  end

  def search_results
    @recipes = search
  end

end

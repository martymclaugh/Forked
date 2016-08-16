class MakesController < ApplicationController
  def create
    @recipe = Recipe.find_or_create_by(spoon_id: params['ingredients']['id'], title: params['ingredients']["title"], image: params['ingredients']['image'])
    @make = Make.create(user_id: current_user.id, recipe_id: @recipe.id)
  end
end

class LikesController < ApplicationController
  def create
    @recipe = Recipe.find_or_create_by(spoon_id: params['ingredients']['id'], title: params['ingredients']["title"], image: params['ingredients']['image'])
    @like = Like.create(user_id: current_user.id, recipe_id: @recipe.id)
    redirect_to "/recipes/preview/#{@recipe.spoon_id}"
  end
end

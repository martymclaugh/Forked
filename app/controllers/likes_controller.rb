class LikesController < ApplicationController
  def create
    add_score(current_user, 10)
    if params[:spoon_id]
      @recipe = Recipe.find_or_create_by(spoon_id: params['ingredients']['id'], title: params['ingredients']["title"], image: params['ingredients']['image'])
      @like = Like.create(user_id: current_user.id, recipe_id: @recipe.id)
      redirect_to "/recipes/preview/#{@recipe.spoon_id}"
    else
     @recipe = Recipe.find(params['id'])
      @like = Like.create(user_id: current_user.id, recipe_id: @recipe.id)
      redirect_to "/recipes/#{@recipe.id}"
    end
  end
end

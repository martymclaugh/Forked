class ApplicationController < ActionController::Base
  require "pp"
  protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :current_user
  helper_method :logged_in?
  helper_method :update_score
  helper_method :subtract_score
  helper_method :user_ingredient_search

  def index
  end

  private
  def current_user

    if session[:user_id]
     @current_user ||=  User.find(session[:user_id])
    end
  end
  def logged_in?
    session[:user_id].present?
  end

  def add_score(user, score)
    new_score = user.chef_score + score
    user_id = user.id
    User.update(user_id, chef_score: new_score)
  end

  def subtract_score(user, score)
    new_score = user.chef_score + score
    user_id = user.id
    User.update(user_id, chef_score: new_score)
  end

  def user_ingredient_search(user)
    user_ingredients_string = ""
    user.ingredients.each do |ingredient|
      user_ingredients_string += ingredient.name
      user_ingredients_string += ", "
    end
    user_ingredients_string.chomp(", ")
  end
end

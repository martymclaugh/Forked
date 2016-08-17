class UsersController < ApplicationController
  before_action :set_auth
  helper_method :set_auth
  # headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
  def show
    @user = User.find(params[:id])
  end


  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
    # puts "***" *20
    # p @auth
  end

  def user_ingredient_search
    user_ingredients_string = ""
    current_user.ingredients.each do |ingredient|
      user_ingredients_string += ingredient
      user_ingredients_string += ", "
    end
    user_ingredients_string.chomp(", ")
  end
end

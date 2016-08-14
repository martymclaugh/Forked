class UsersController < ApplicationController
  before_action :set_auth

  def index
  	@recipe = Recipe.all
  end

  def profile
  end

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end

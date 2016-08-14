class HomeController < ApplicationController
  before_action :set_auth

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end

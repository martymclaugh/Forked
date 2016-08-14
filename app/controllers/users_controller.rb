class UsersController < ApplicationController
  before_action :set_auth
  helper_method :set_auth
  # headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
  def profile

  end


  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

end

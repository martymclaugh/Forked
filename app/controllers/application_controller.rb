class ApplicationController < ActionController::Base
  require "pp"
  protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :current_user

  private

  def current_user

    if session[:user_id]
     @current_user ||=  User.find(session[:user_id])
    end
  end


end

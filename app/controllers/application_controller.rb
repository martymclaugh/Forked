class ApplicationController < ActionController::Base
  require "pp"
  protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }
  helper_method :current_user
  helper_method :logged_in?

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



end

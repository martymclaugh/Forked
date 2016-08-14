class UsersController < ApplicationController
  def show
    @users = User.all
  end

  def profile
    @user = current_user
  end

  def index
  end

  def new
  end
end

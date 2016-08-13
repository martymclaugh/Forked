class SearchesController < ApplicationController
  def index
  end

  def show
    @recipes = search
    render :json => @recipes
  end
end

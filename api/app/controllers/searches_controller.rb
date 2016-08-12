class SearchesController < ApplicationController
  def index
  end

  # def create
  #   @recipes = search
  #   redirect_to "/searches/show"
  # end

  def show
    @recipes = search
  end
end

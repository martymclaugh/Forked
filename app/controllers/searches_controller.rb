class SearchesController < ApplicationController
  def index
  end

  def search
    @recipes = search
  end
end

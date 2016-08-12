class SearchesController < ApplicationController
  def index
  end

  def create
    redirect_to "/searches/show"
    @results = search
  end
  def show
  end
end

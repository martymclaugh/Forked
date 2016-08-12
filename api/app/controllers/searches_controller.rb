class SearchesController < ApplicationController
  def index
  end

  def create
    @search = Search.create
    redirect_to "searches/show"
    # @results = search
  end
end

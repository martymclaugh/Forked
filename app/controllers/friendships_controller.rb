class FriendshipsController < ApplicationController

  def index
    if params[:search]
      @friends = User.search(params[:search])
      if @friends.length > 0
        @friends
      else
        @errors = "No users matched your search criteria"
      end
    end
  end
end

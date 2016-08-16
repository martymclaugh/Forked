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

  def create
    p params
    Friendship.new(user_id: current_user.id, friend_id: params(:id))
    redirect :'friendships#index'
  end

end

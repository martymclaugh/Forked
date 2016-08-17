class FriendshipsController < ApplicationController

  def index
    if params[:search]
      @friends = User.search(params[:search])
      if @friends.length > 0
        @friends.reject{|f| f.id == current_user.id}
        @friends
      else
        @errors = "No users matched your search criteria"
      end
    end
  end

  def create
    friend = Friendship.create(user_id: current_user.id, friend_id: params[:id])
    friend2 = Friendship.create(user_id: params[:id], friend_id: current_user.id)
     if friend.valid? && friend2.valid?
       redirect_to "/users/#{params[:id]}"
     else
       redirect_to "/users/#{params[:id]}"
     end
  end

  def destroy
    friend = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    friend2 = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    Friendship.destroy(friend.id)
    Friendship.destroy(friend2.id)
    redirect_to "/users/#{params[:id]}"
  end

end

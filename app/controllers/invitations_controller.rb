class InvitationsController < ApplicationController

  def new
  end

  def create
    p params
    # Create new invitation object
    invitation = Invitation.create(creator_id: params[:user_id], cuisine: params[:invitation][:cuisine], datetime: params[:invitation][:datetime], location: params[:invitation][:location])
    p invitation
    user_invitation = UserInvitation.create(invited_id: params[:invited_id], invitation_id: invitation.id)
    p user_invitation
    redirect_to user_path(User.find(params[:user_id]))
    # Create 2 new user_invitation objects
  end
  
end

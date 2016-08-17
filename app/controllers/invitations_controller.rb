class InvitationsController < ApplicationController

  def new
  end

  def create
    p params
    # Create new invitation object
    invitation = Invitation.create(cuisine: params[:invitation][:cuisine], datetime: params[:invitation][:datetime], location: params[:invitation][:location])
    p invitation
    # Create 2 new user_invitation objects
  end
end

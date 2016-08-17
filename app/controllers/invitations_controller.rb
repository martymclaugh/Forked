class InvitationsController < ApplicationController

  def new
  end

  def create
    p params
    # Create new invitation object
    invitation = Invitation.create()
    # Create 2 new user_invitation objects
  end
end

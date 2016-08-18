class DinnerPartiesController < ApplicationController

  def create
    @invitation = Invitation.find(params[:invitation_id])
    @dinner_party = DinnerParty.new(cuisine: @invitation.cuisine, datetime: @invitation.datetime, location: @invitation.location)
    if @dinner_party.save
      UserDinnerParty.create(dinner_party_id: @dinner_party.id, user_id: params[:user_id])
      UserDinnerParty.create(dinner_party_id: @dinner_party.id, user_id: @invitation.creator_id)
      Invitation.where(id: @invitation.id).delete_all
      UserInvitation.where(invitation_id: @invitation.id).delete_all
      redirect_to user_path(User.find(params[:user_id]))
    else
      puts "Dinner party not created"
      redirect_to user_path(current_user)
    end
  end

end

class UsersController < ApplicationController
  before_action :set_auth
  # headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
  def show
    @user = User.find(params[:id])
    @invitations = []
    @dinner_parties = @user.dinner_parties
    @user.user_invitations.each do |user_invitation|
      @invitations << Invitation.find(user_invitation.invitation_id)
    end
    @invitations
  end


  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
    # puts "***" *20
    # p @auth
  end


end

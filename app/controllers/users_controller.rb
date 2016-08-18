class UsersController < ApplicationController
  before_action :set_auth
  # headers['Access-Control-Allow-Origin'] = 'http://localhost:9000'
  def show
    @user = User.find(params[:id])
    @invitations = []
    p @user.user_invitations
    @user.user_invitations.each do |user_invitation|
      @invitations << Invitation.find(user_invitation.invitation_id)
    end
    p "*" *100
    p @invitations
  end


  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
    # puts "***" *20
    # p @auth
  end


end

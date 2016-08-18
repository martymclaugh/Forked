class Invitation < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id
  has_many :user_invitations

  def destroy
    Invitation.destory(params[:invitation_id])
    redirect_to user_path(current_user)
  end

end

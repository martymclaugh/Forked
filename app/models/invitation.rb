class Invitation < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id
  has_many user_invitations
end

class UserInvitation < ApplicationRecord
  belongs_to :user, foreign_key: :invited_id
  belongs_to :invitation
end

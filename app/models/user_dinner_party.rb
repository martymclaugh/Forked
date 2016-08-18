class UserDinnerParty < ApplicationRecord
  belongs_to :user
  belongs_to :dinner_party
end

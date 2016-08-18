class DinnerParty < ApplicationRecord
  has_many :users, through: :user_dinner_parties
  has_many :user_dinner_parties

end

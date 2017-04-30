class Team < ApplicationRecord
  has_many :participations
  has_many :bets
end

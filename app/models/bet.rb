class Bet < ApplicationRecord
  validates :ammount, presence: true, allow_blank: false
  validates :bet_state, presence: true, allow_blank: false
  validates :match_id, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :team_id, presence: true, allow_blank: false
  belongs_to :user
  belongs_to :match
  belongs_to :team
end

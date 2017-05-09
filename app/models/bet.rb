class Bet < ApplicationRecord
  validates :ammount, :numericality => {:greater_than_or_equal_to => 0}, presence: true, allow_blank: false
  validates :bet_state, presence: true, allow_blank: false
  validates :match_id, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :team_id, presence: true, allow_blank: false
  validate :bet_before_expiration_date?
  belongs_to :user
  belongs_to :match
  belongs_to :team

  def bet_before_expiration_date?
    current_match = Match.find(match_id)
    if current_match.bet_date.day < Time.now.day
      errors.add :base, "Match has already closed"
    end
  end
end

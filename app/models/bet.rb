class Bet < ApplicationRecord
  validates :ammount, :numericality => {:greater_than_or_equal_to => 0}, presence: true, allow_blank: false
  validates :bet_state, presence: true, allow_blank: false
  validates :match_id, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validates :team_id, presence: true, allow_blank: false
  validate :bet_before_expiration_date?
  validate :has_suf_money?, :on => :create
  validate :has_suf_updt_money?, :on => :update

  belongs_to :user
  belongs_to :match
  belongs_to :team

  def bet_before_expiration_date?
    current_match = Match.find(match_id)
    if current_match.bet_date < Date.today
      errors.add :base, "Match bets has already been closed"
    end
  end

  def has_suf_money?
    current_user = User.find(user_id)
    if current_user.coins - ammount < 0
      errors.add :base, "Not enought coins"
    else
      current_user.update_column(:coins, current_user.coins - ammount)
    end
  end

  def has_suf_updt_money?
    returned = Bet.find(id).ammount
    current_user = User.find(user_id)
    if current_user.coins - ammount + returned < 0
      errors.add :base, "Not enought coins"
    else
      current_user.update_column(:coins, current_user.coins - ammount + returned)
    end
  end

end

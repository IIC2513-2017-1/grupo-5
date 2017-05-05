class Match < ApplicationRecord
  validates :match_date, presence: true, allow_blank: false
  validates :bet_date, presence: true, allow_blank: false
  validates :state, presence: true, allow_blank: false
  validates :event_id, presence: true, allow_blank: false
  validate :bet_date_before_match_date?
  has_many :bets
  belongs_to :event

  def bet_date_before_match_date?
    if bet_date > match_date
      errors.add :bet_date, "must be before match date"
    end
  end
end

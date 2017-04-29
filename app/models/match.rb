class Match < ApplicationRecord
  validates :match_date, presence: true, allow_blank: false
  validates :bet_date, presence: true, allow_blank: false
  validates :state, presence: true, allow_blank: false
  validates :event_id, presence: true, allow_blank: false
  has_many :bets
  belongs_to :event
end

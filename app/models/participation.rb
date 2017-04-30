class Participation < ApplicationRecord
  validates :match_id, presence: true, allow_blank: false
  validates :team_id, presence: true, allow_blank: false
  belongs_to :team
  belongs_to :match
end

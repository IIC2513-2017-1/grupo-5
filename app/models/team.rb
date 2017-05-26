class Team < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing_team.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :avatar, :in => 0.kilobytes..500.kilobytes

  has_many :participations
  has_many :bets
end

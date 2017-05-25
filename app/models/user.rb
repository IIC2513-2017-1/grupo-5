class User < ApplicationRecord
  #Role 0: Admin
  #Role 1: Normal user
  #Role 2: Event manager
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"

  validates :coins, :numericality => {:greater_than_or_equal_to => 0}
  validates :role, :numericality => {:greater_than_or_equal_to => 0}
  validates :password, presence: true, length: { minimum: 5 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :bets
  has_many :events
  has_many :invitations
end

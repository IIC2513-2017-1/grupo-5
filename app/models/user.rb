class User < ApplicationRecord
  has_secure_password
  
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

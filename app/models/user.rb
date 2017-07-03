class User < ApplicationRecord
  #Role 0: Admin
  #Role 1: Normal user
  #Role 2: Event manager
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :avatar, :in => 0.kilobytes..500.kilobytes

  validates :coins, :numericality => {:greater_than_or_equal_to => 0}
  validates :role, :numericality => {:greater_than_or_equal_to => 0}
  validates :password, presence: true, length: { minimum: 5 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :bets
  has_many :events
  has_many :invitations

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  has_many :followed_relationships, foreign_key: :followed_id, class_name: 'Follow', dependent: :destroy

  has_many :following, through: :following_relationships, source: :followed
  has_many :followers, through: :followed_relationships, source: :follower

  def self.search(search)
    if search
      where('first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end



end

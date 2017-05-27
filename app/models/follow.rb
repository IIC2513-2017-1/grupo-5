class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'

  has_many :follower_relationships, foreign_key: :following_id,
                                    class_name: 'Follow', dependent: :destroy
  has_many :following_relationships, foreign_key: :follower_id,
                                    class_name: 'Follow', dependent: :destroy

  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following, through: :following_relationships, source: :following
end

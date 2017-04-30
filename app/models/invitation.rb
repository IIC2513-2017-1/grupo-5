class Invitation < ApplicationRecord
  validates :user_id, presence: true, allow_blank: false
  validates :event_id, presence: true, allow_blank: false
  belongs_to :user
  belongs_to :event
end

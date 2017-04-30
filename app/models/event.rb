class Event < ApplicationRecord
  validates :event_type, presence: true, allow_blank: false
  validates :date_start, presence: true, allow_blank: false
  validates :date_end, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  has_many :matches
  belongs_to :user
end

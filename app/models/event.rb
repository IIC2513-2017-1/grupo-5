class Event < ApplicationRecord
  validates :event_type, presence: true, allow_blank: false
  validates :date_start, presence: true, allow_blank: false
  validates :date_end, presence: true, allow_blank: false
  validates :user_id, presence: true, allow_blank: false
  validate :date_start_before_date_end?
  has_many :matches
  has_many :invitations
  belongs_to :user

  def date_start_before_date_end?
    if date_start > date_end
      errors.add :date_start, "must be before date end"
    end
  end
end

class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendences, foreign_key: :attendee_id
  has_many :attended_events, through: :attendences

  def upcoming_events
    attended_events.upcoming_events
  end

  def previous_events
    attended_events.previous_events
  end
end

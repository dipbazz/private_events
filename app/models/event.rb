class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendences, foreign_key: :attended_event_id
    has_many :attendees, through: :attendences
end

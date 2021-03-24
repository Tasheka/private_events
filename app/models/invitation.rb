class Invitation < ApplicationRecord
    belongs_to :attendee, class_name: "User", foreign_key: "attendee_id", required: false
    belongs_to :attended_event, class_name: "Event", foreign_key: 'event_id'
end
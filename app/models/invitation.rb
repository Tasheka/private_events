class Invitation < ApplicationRecord
    belongs_to :attendee, class_name: "User", foreign_key: "attendee_id", required: false
    belongs_to :attended_event, class_name: "Event", foreign_key: 'event_id'
    scope :past_events, -> { where('created_at < ?', Time.now) }
    scope :upcoming_events, -> { where('created_at > ?', Time.now) }
  
    def self.find_upcoming_events
      upcoming_events.order('created_at DESC').pluck(:location, :date, :name, :description)
    end
  
    def self.find_past_events
      past_events.order('created_at DESC').pluck(:location, :date, :name, :description)
    end
end
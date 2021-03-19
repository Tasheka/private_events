class User < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key: "event_id"
  has_many :attended_events, through: :invitations, source: :event
  has_many :invitations
end

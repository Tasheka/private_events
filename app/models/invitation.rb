# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :attended_event, foreign_key: :event_id, class_name: :Event, required: false
  belongs_to :attendee, foreign_key: :user_id, class_name: :User, required: false
end

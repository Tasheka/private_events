class User < ApplicationRecord
    belongs_to :attendee, class: "User"
    belongs_to :event, class_name: "Event"
  end
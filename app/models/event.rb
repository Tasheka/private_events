class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :invitations 
  has_many :attendee, through: :invitations, source: :attendee
end

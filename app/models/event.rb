class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :invitations 
  has_many :attendee, through: :invitations, class_name: "User", foreign_key: :user_id
  scope :past_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }

  def self.find_upcoming_events
    upcoming_events.order('created_at DESC').pluck(:location, :date, :name, :description)
  end

  def self.find_past_events
    past_events.order('created_at DESC').pluck(:location, :date, :name, :description)
  end
end
 
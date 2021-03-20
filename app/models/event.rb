class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: "User"
  has_many :invitations 
  has_many :attendee, through: :invitations, source: :user
  scope :past_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }

  #def self.upcoming_events
  #  upcoming_events.order('created_at DESC').pluck(:location, :date, :name, :description)
  #end

 # def self.past_events
   # past_events.order('created_at DESC').pluck(:location, :date, :name, :description)
 # end
end

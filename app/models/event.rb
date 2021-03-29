# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user, foreign_key: true, required: false
  has_many :invitations
  has_many :users, through: :invitations
   
  scope :past_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date > ?', Time.now) }

  def self.find_upcoming_events
    upcoming_events.order('created_at DESC').pluck(:location, :date, :name, :description)
  end

  def self.find_past_events
    past_events.order('created_at DESC').pluck(:location, :date, :name, :description)
  end
end

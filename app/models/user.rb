# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events
  
  has_many :invitations
  has_many :attended_events, through: :invitations, source: :event
end

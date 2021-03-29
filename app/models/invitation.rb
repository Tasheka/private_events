# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :event, required: false
  belongs_to :user, required: false

  #belongs_to :creator, foreign_key: :user_id, class_name: :User, required: false
end

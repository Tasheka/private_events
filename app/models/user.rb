class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 3..12 }
  validates :email, presence: true, uniqueness: true
  has_many :events
end

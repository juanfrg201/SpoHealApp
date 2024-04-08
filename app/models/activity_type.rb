class ActivityType < ApplicationRecord
  has_many :activities
  has_many :user_activity_types
  validates :identifier, uniqueness: { message: "ya está en uso" }
end

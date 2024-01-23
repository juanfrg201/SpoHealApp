class Activity < ApplicationRecord
  belongs_to :activity_type
  has_many :activity_recomendations
  has_many :user_activities
end

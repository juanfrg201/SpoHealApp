class Activity < ApplicationRecord
  has_one_attached :image
  belongs_to :activity_type
  has_many :activity_recomendations
  has_many :user_activities

  enum intensity: {
    "Baja" => 0,
    "Intermedia" => 1,
    "Alta" => 2
  }
end

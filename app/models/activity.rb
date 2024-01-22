class Activity < ApplicationRecord
  belongs_to :activity_type
  has_many :activity_recomendations
end

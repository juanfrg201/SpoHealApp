class ActivityRecomendation < ApplicationRecord
  belongs_to :activity
  belongs_to :user
end

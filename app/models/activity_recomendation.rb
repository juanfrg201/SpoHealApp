# frozen_string_literal: true

class ActivityRecomendation < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  enum rating: {
    'Me senti mal' => 0,
    'Me senti normal' => 1,
    'Me senti bien' => 2,
    'Me senti Excelente' => 3
  }
end

# frozen_string_literal: true

class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  enum rating: {
    'Me senti mal' => 0,
    'Me senti normal' => 1,
    'Me senti bien' => 2,
    'Me senti Excelente' => 3
  }
end

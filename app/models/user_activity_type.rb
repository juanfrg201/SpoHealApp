# frozen_string_literal: true

class UserActivityType < ApplicationRecord
  belongs_to :user
  belongs_to :activity_type
end

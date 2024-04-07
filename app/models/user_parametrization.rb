# frozen_string_literal: true

class UserParametrization < ApplicationRecord
  belongs_to :user

  validates :weight, presence: true
  validates :height, presence: true

  def calculate_imc
    height_m = height.to_i / 100
    weight.to_i / height_m * height_m
  end
end

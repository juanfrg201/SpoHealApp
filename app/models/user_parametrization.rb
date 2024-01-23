class UserParametrization < ApplicationRecord
  belongs_to :user

  def calculate_imc
    height_m = self.height.to_i / 100
    self.weight.to_i / height_m * height_m
  end
end

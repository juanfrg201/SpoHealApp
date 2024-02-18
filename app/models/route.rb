class Route < ApplicationRecord
  has_many :user_routes

  enum level: {
    "facil" => 0,
    "medio" => 1,
    "intenso" => 2
  }

  enum presure: {
    "baja" => 0,
    "media" => 1,
    "alta" => 2
  }

end

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

  def route_intensity 
    if self.level == "facil"
      "Baja"
    elsif self.level == "medio"
      "Intermedia"
    else
      "Alta"
    end
  end

  def route_preasure 
    if self.level == "baja"
      10
    elsif self.level == "media"
      30
    else
      60
    end
  end

end

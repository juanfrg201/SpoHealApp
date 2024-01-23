class ActiveDay < ApplicationRecord
  belongs_to :user

  enum day: {
    "lunes" => 0,
    "martes" => 1,
    "miércoles" => 2,  # Agregado una coma después del valor 2
    "jueves" => 3,
    "viernes" => 4,
    "sábado" => 5,  # Corregido a "sábado" y agregado una coma
    "domingo" => 6
  }
end

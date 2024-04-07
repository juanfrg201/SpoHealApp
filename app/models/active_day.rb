# frozen_string_literal: true

class ActiveDay < ApplicationRecord
  belongs_to :user

  enum day: {
    'lunes' => 0,
    'martes' => 1,
    'miércoles' => 2, # Agregado una coma después del valor 2
    'jueves' => 3,
    'viernes' => 4,
    'sábado' => 5, # Corregido a "sábado" y agregado una coma
    'domingo' => 6
  }

  def self.motivacional_message
    motivational_messages = [
      'Cada paso hacia hábitos más saludables te acerca a una mejor versión de ti mismo.',
      'La consistencia en tus hábitos saludables es la clave para alcanzar tus metas.',
      'Pequeños cambios pueden hacer una gran diferencia en tu salud a largo plazo.',
      'Cada día es una nueva oportunidad para elegir hábitos que te hagan sentir bien.',
      'Recuerda que tu salud es tu mayor riqueza, ¡invierte en ti mismo!',
      'No se trata de ser perfecto, se trata de progresar hacia una vida más saludable.',
      'Celebra tus pequeños logros en el camino hacia una vida más saludable.',
      'Tu cuerpo es tu templo, cuídalo con hábitos saludables.',
      'La mejor forma de predecir tu futuro es creando hábitos saludables hoy.',
      'Tu salud es un reflejo de tus hábitos diarios. Elige sabiamente.',
      'Elige hábitos que te hagan sentir orgulloso de ti mismo.',
      'Elige hábitos saludables que te empoderen y te hagan sentir fuerte.',
      'No esperes a mañana, comienza a cultivar hábitos saludables hoy mismo.',
      'Elige hábitos que te den energía y vitalidad para enfrentar cada día.',
      'Tu cuerpo es tu mejor inversión, asegúrate de cuidarlo con buenos hábitos.',
      'Cada decisión que tomas te acerca o te aleja de una vida más saludable. Elige sabiamente.',
      'No te conformes con menos de lo que tu cuerpo merece. Cultiva hábitos saludables con amor.',
      'La fuerza de voluntad es como un músculo, cuanto más la ejercites, más fuerte se volverá.',
      'Tu salud es tu mayor activo, no dejes que se deteriore por hábitos poco saludables.',
      'Cada elección que haces te acerca o te aleja de la persona que quieres ser. Elige salud.'
    ]
    motivational_messages.sample
  end
end

module Services
  class SendNotification

    def perform
      send
    end

    private

    def messages 
      mensajes_motivacionales = [
        "No importa cuán lento vayas, siempre y cuando no te detengas. Levántate y haz ejercicio hoy.",
        "Tu cuerpo es tu templo, cuídalo y fortalécelo con ejercicio regular.",
        "El único entrenamiento que lamentarás es el que no hagas. ¡Levántate y muévete!",
        "Cada paso que das te acerca a tus metas. ¿Qué estás esperando? ¡Comienza a moverte!",
        "El dolor que sientes hoy es la fuerza que sentirás mañana. No te rindas, sigue adelante.",
        "Cada gota de sudor es un paso hacia adelante. Haz ejercicio con pasión y determinación.",
        "Recuerda por qué empezaste. Mantén tu motivación alta y haz ejercicio regularmente.",
        "No te preocupes por los resultados inmediatos. Confía en el proceso y sigue adelante con tu rutina de ejercicio.",
        "El ejercicio no es solo una actividad, es un compromiso contigo mismo para vivir una vida más saludable y feliz.",
        "Tu cuerpo puede hacer cualquier cosa, es tu mente la que necesitas convencer. ¡Haz ejercicio y desafía tus límites!"
      ]
      
    end

    def send 
      User.all.each do |user|
        message = messages.sample
        user.notify(message + "visita SpoHealApp para revisar que habito puedes mejorar https://spoheal.onrender.com/home_pages")
      end
    end
    
  end
end
require 'rails_helper'
RSpec.describe Activity, type: :model do
    describe "associations" do
      it "debería tener una imagen adjunta" do
        resultado = described_class.new.respond_to?(:image_attachment)
        puts_resultado("debería tener una imagen adjunta", resultado)
        expect(resultado).to be true
      end
      
      it "debería pertenecer a un tipo de actividad" do
        association = described_class.reflect_on_association(:activity_type)
        resultado = association.macro == :belongs_to
        puts_resultado("debería pertenecer a un tipo de actividad", resultado)
        expect(association.macro).to eq :belongs_to
      end
      
      it "debería tener muchas recomendaciones de actividad" do
        association = described_class.reflect_on_association(:activity_recomendations)
        resultado = association.macro == :has_many
        puts_resultado("debería tener muchas recomendaciones de actividad", resultado)
        expect(association.macro).to eq :has_many
      end
      
      it "debería tener muchas actividades de usuario" do
        association = described_class.reflect_on_association(:user_activities)
        resultado = association.macro == :has_many
        puts_resultado("debería tener muchas actividades de usuario", resultado)
        expect(association.macro).to eq :has_many
      end
    end
  
    describe "validations" do
      it "debería validar la presencia del nombre" do
        activity = Activity.new(name: nil)
        resultado = activity.valid?
        puts_resultado("debería validar la presencia del nombre", !resultado)
        expect(resultado).to be false
      end
      
      it "debería validar la presencia de la descripción" do
        activity = Activity.new(description: nil)
        resultado = activity.valid?
        puts_resultado("debería validar la presencia de la descripción", !resultado)
        expect(resultado).to be false
      end
      
      it "debería validar la presencia de los beneficios" do
        activity = Activity.new(benefits: nil)
        resultado = activity.valid?
        puts_resultado("debería validar la presencia de los beneficios", !resultado)
        expect(resultado).to be false
      end
    end
  
    def puts_resultado(mensaje, resultado)
      if resultado
        puts "Prueba '#{mensaje}' \e[32mpasó\e[0m."
      else
        puts "Prueba '#{mensaje}' \e[31mfalló\e[0m."
      end
    end
  end
  
  
require 'rails_helper'

RSpec.describe ActivityType, type: :model do
    describe "associations" do
      it "debería tener muchas actividades" do
        association = described_class.reflect_on_association(:activities)
        resultado = association.macro == :has_many
        puts_resultado("debería tener muchas actividades", resultado)
        expect(association.macro).to eq :has_many
      end
      
      it "debería tener muchas actividades de usuario" do
        association = described_class.reflect_on_association(:user_activity_types)
        resultado = association.macro == :has_many
        puts_resultado("debería tener muchas actividades de usuario", resultado)
        expect(association.macro).to eq :has_many
      end
    end
  
    describe "validations" do
      it "debería validar la unicidad del identificador" do
        identifier = "identificador_unico"
        ActivityType.create(identifier: identifier)
        
        activity_type = ActivityType.new(identifier: identifier)
        resultado = activity_type.valid?
        puts_resultado("debería validar la unicidad del identificador", !resultado)
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
  
require 'rails_helper'

RSpec.describe Route, type: :model do
    describe "associations" do
      it "debería tener muchas user_routes" do
        association = described_class.reflect_on_association(:user_routes)
        resultado = association.macro == :has_many
        puts_resultado("debería tener muchas user_routes", resultado)
        expect(association.macro).to eq :has_many
      end
    end
  
    describe "validations" do
      it "debería validar la presencia de la descripción" do
        route = Route.new(description: nil)
        resultado = route.valid?
        puts_resultado("debería validar la presencia de la descripción", !resultado)
        expect(resultado).to be false
      end
    end
  
    describe "methods" do
      describe "#route_intensity" do
        it "debería devolver 'Baja' para nivel 'facil'" do
          route = Route.new(level: "facil")
          expect(route.route_intensity).to eq "Baja"
        end
  
        it "debería devolver 'Intermedia' para nivel 'medio'" do
          route = Route.new(level: "medio")
          expect(route.route_intensity).to eq "Intermedia"
        end
  
        it "debería devolver 'Alta' para nivel 'intenso'" do
          route = Route.new(level: "intenso")
          expect(route.route_intensity).to eq "Alta"
        end
      end
  
      describe "#route_preasure" do
        it "debería devolver 10 para presión 'baja'" do
          route = Route.new(level: "facil")
          expect(route.route_preasure).to eq 10
        end
  
        it "debería devolver 30 para presión 'media'" do
          route = Route.new(level: "medio")
          expect(route.route_preasure).to eq 30
        end

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
  
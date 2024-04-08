require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = User.create!(email: "juanf@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
  end
  
  describe "validations" do
    it "debería devolver error por contraseña corta" do
      @user.password = "feli"
      resultado = @user.valid?
      puts_resultado_validaciones("debería devolver error por contraseña corta", resultado)
      expect(@user).not_to be_valid
    end

    it "debería devolver error por contraseña vacía" do
      @user.password = nil
      resultado = @user.valid?
      puts_resultado_validaciones("debería devolver error por contraseña vacía", resultado)
      expect(@user).not_to be_valid
    end

    it "debería devolver error por email vacío" do
      @user.email = nil
      resultado = @user.valid?
      puts_resultado_validaciones("debería devolver error por email vacío", resultado)
      expect(@user).not_to be_valid
    end

    it "debería devolver error por email incorrecto sin @" do
      @user.email = "juanfelipe.com"
      resultado = @user.valid?
      puts_resultado_validaciones("debería devolver error por email incorrecto sin @", resultado)
      expect(@user).not_to be_valid
    end

    it "debería devolver error por email repetido" do
      otro_usuario = User.new(email: "juanf@gmail.com", password: "otracontraseña", name: "Otro", last_name: "Usuario", years: "30")
      resultado = otro_usuario.valid?
      puts_resultado_validaciones("debería devolver error por email repetido", resultado)
      expect(otro_usuario).not_to be_valid
    end
    it "debería validar la presencia del nombre" do
        @user.name = nil
        resultado = @user.valid?
        puts_resultado_validaciones("debería validar la presencia del nombre", resultado)
        expect(resultado).to be false
      end
  
      it "debería validar la presencia del apellido" do
        @user.last_name = nil
        resultado = @user.valid?
        puts_resultado_validaciones("debería validar la presencia del apellido", resultado)
        expect(resultado).to be false
      end
  
    it "debería validar la presencia de la edad" do
        @user.years = nil
        resultado = @user.valid?
        puts_resultado_validaciones("debería validar la presencia de la edad", resultado)
        expect(resultado).to be false
    end
  end

  describe "associations" do
    it "debería tener una relación has_one con user_parametrization" do
        association = described_class.reflect_on_association(:user_parametrization)
        resultado = association.macro == :has_one
        puts_resultado("debería tener una relación has_one con user_parametrization", resultado)
        expect(association.macro).to eq :has_one
      end
  
      it "debería tener una relación has_many con active_days" do
        association = described_class.reflect_on_association(:active_days)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con active_days", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con activity_recomendations" do
        association = described_class.reflect_on_association(:activity_recomendations)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con activity_recomendations", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con communities" do
        association = described_class.reflect_on_association(:communities)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con communities", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con community_posts" do
        association = described_class.reflect_on_association(:community_posts)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con community_posts", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con user_activities" do
        association = described_class.reflect_on_association(:user_activities)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con user_activities", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con webpush_subscriptions" do
        association = described_class.reflect_on_association(:webpush_subscriptions)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con webpush_subscriptions", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con user_activity_types" do
        association = described_class.reflect_on_association(:user_activity_types)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con user_activity_types", resultado)
        expect(association.macro).to eq :has_many
      end
  
      it "debería tener una relación has_many con user_routes" do
        association = described_class.reflect_on_association(:user_routes)
        resultado = association.macro == :has_many
        puts_resultado("debería tener una relación has_many con user_routes", resultado)
        expect(association.macro).to eq :has_many
      end
  end

  def puts_resultado(mensaje, resultado)
    if resultado
      puts "Prueba '#{mensaje}' \e[32mpasó\e[0m."
    else
      puts "Prueba '#{mensaje}' \e[31mfalló\e[0m."
    end
  end

  def puts_resultado_validaciones(mensaje, resultado)
    if !resultado
      puts "Prueba '#{mensaje}' \e[32mpasó\e[0m."
    else
      puts "Prueba '#{mensaje}' \e[31mfalló\e[0m."
    end
  end
end

  
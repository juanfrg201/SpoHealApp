# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UserParametrization, type: :model do
  before(:each) do
    @user = User.create!(email: 'juanfe@gmail.com', password: 'feliper1972', name: 'Felipe', last_name: 'Ruiz',
                         years: '21')
    @user_parametrization = UserParametrization.create!(
      user_id: @user.id,
      weight: '81,5',
      height: '182',
      imc: '81',
      sport_medical_restriccion: false,
      sport_muscle_pains: false,
      general_pain: false,
      is_hipertension: false,
      is_asthma: false,
      is_chest_pain: false,
      pain_cardiac: false,
      cardiac_family_pain: false,
      cardiac_family_pain: false,
      cholesterol_pain: false,
      dizzines_pain: false,
      smoke_pain: false,
      covid_19: false
    )
  end

  describe 'validations' do
    it 'debería devolver error por contraseña corta' do
      @user_parametrization.weight = nil
      resultado = @user_parametrization.valid?
      puts_resultado('debería devolver error por contraseña corta', !resultado)
      expect(@user_parametrization).not_to be_valid
    end

    it 'debería devolver error por contraseña corta' do
      @user_parametrization.height = nil
      resultado = @user_parametrization.valid?
      puts_resultado('debería devolver error por contraseña corta', !resultado)
      expect(@user_parametrization).not_to be_valid
    end
  end

  describe 'associations' do
    it 'debería pertenecer a un usuario' do
      association = described_class.reflect_on_association(:user)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a un usuario', resultado)
      expect(association.macro).to eq :belongs_to
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

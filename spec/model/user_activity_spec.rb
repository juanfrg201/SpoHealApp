# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UserActivity, type: :model do
  describe 'associations' do
    it 'debería pertenecer a un usuario' do
      association = described_class.reflect_on_association(:user)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a un usuario', resultado)
      expect(association.macro).to eq :belongs_to
    end

    it 'debería pertenecer a una actividad' do
      association = described_class.reflect_on_association(:activity)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a una actividad', resultado)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'enum rating' do
    it 'debería tener el enumerador rating definido' do
      expect(UserActivity.ratings).to eq({
                                           'Me senti mal' => 0,
                                           'Me senti normal' => 1,
                                           'Me senti bien' => 2,
                                           'Me senti Excelente' => 3
                                         })
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

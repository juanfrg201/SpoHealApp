# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ActiveDay, type: :model do
  describe 'associations' do
    it 'debería pertenecer a un usuario' do
      association = described_class.reflect_on_association(:user)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a un usuario', resultado)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'enums' do
    it 'debería tener una enumeración para day' do
      expect(described_class).to respond_to(:days)
    end
  end

  describe 'motivational_message' do
    it 'debería devolver un mensaje motivacional' do
      message = described_class.motivacional_message
      expect(message).not_to be_empty
      puts_resultado('debería devolver un mensaje motivacional', !message.empty?)
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

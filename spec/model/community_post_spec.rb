# frozen_string_literal: true

require 'rails_helper'
RSpec.describe CommunityPost, type: :model do
  describe 'associations' do
    it 'debería pertenecer a un usuario' do
      association = described_class.reflect_on_association(:user)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a un usuario', resultado)
      expect(association.macro).to eq :belongs_to
    end

    it 'debería pertenecer a una comunidad' do
      association = described_class.reflect_on_association(:community)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a una comunidad', resultado)
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

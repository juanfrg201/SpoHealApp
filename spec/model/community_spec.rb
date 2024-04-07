# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Community, type: :model do
  puts 'Test modelo Comunity **************************'
  describe 'associations' do
    it 'debería tener una imagen adjunta' do
      resultado = described_class.new.respond_to?(:image_attachment)
      puts_resultado('debería tener una imagen adjunta', resultado)
      expect(resultado).to be true
    end

    it 'debería pertenecer a un usuario' do
      association = described_class.reflect_on_association(:user)
      resultado = association.macro == :belongs_to
      puts_resultado('debería pertenecer a un usuario', resultado)
      expect(association.macro).to eq :belongs_to
    end

    it 'debería tener muchos posts de comunidad' do
      association = described_class.reflect_on_association(:community_posts)
      resultado = association.macro == :has_many
      puts_resultado('debería tener muchos posts de comunidad', resultado)
      expect(association.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'debería validar la presencia del asunto' do
      community = Community.new(issue: nil)
      resultado = community.valid?
      puts_resultado('debería validar la presencia del asunto', !resultado)
      expect(resultado).to be false
    end

    it 'debería validar la presencia del nombre' do
      community = Community.new(name: nil)
      resultado = community.valid?
      puts_resultado('debería validar la presencia del nombre', !resultado)
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

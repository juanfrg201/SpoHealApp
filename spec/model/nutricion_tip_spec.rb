# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NutricionTip, type: :model do
  describe 'associations' do
    it 'debería tener una imagen adjunta' do
      resultado = described_class.new.respond_to?(:image_attachment)
      if resultado
        puts "Prueba 'debería tener una imagen adjunta' \e[32mpasó\e[0m."
      else
        puts "Prueba 'debería tener una imagen adjunta' \e[31mfalló\e[0m."
      end
      expect(resultado).to be true
    end
  end
end

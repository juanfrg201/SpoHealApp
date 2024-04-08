require 'csv'
module Services
  class NutricionTipsUpload
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def perform
      if @file.present?
        call
      end
    end

    private

    def call
      CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
        activity_type_params = {
          name: row['Nombre'],
          benefits: row['Beneficio'],
          links: row['Links'].present? ? row['Links'].split("*") : []
        }
        NutricionTip.create(activity_type_params)
      end
    end
    
  end
end
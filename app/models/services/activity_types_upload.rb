require 'csv'
module Services
  class ActivityTypesUpload
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
      CSV.foreach(file.path, headers: true, encoding: 'ISO-8859-1') do |row|
        activity_type_params = {
          name: row['Nombre'],
          description: row['Descripción'],
          benefits: row['Beneficios'],
          identifier: row['IDENTIFICADOR']
        }
        ActivityType.create(activity_type_params)
      end
    end
    
  end
end
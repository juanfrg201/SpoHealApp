# frozen_string_literal: true

require 'csv'
module Services
  class ActivityTypesUpload
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def perform
      return unless @file.present?

      call
    end

    private

    def call
      CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
        process_row(row)
      end
    rescue CSV::MalformedCSVError
      # Si la codificación UTF-8 falla, intentamos con ISO-8859-1
      CSV.foreach(file.path, headers: true, encoding: 'ISO-8859-1') do |row|
        process_row(row)
      end
    end

    def process_row(row)
      activity_type = ActivityType.find_or_initialize_by(identifier: row['IDENTIFICADOR'])

      activity_type_params = {
        name: row['Nombre'],
        description: row['Descripción'],
        benefits: row['Beneficios'],
        identifier: row['IDENTIFICADOR']
      }

      activity_type.update(activity_type_params)
    end
  end
end

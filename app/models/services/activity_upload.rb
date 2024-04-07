# frozen_string_literal: true

require 'csv'
module Services
  class ActivityUpload
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
      activity = Activity.find_or_initialize_by(name: row['Nombre'])

      activity_params = {
        activity_type_id: ActivityType.find_by(identifier: row['Tipo actividad']).id,
        description: row['Descripcion'],
        tutorial: row['Tutorial'],
        benefits: row['beneficio'],
        identifier: row['identificador'],
        link: row['Links'].present? ? row['Links'].split('*') : nil,
        intensity: row['intensidad'].strip,
        duartion: row['duracion (min)'],
        sport_medical_restriccion: row['SportMedicalRestriccion'] == 'VERDADERO',
        sport_muscle_pains: row['SportMusclePain'] == 'VERDADERO',
        general_pain: row['general_pain'] == 'VERDADERO',
        is_hipertension: row['is_hipertension'] == 'VERDADERO',
        is_asthma: row['is_asthma'] == 'VERDADERO',
        is_chest_pain: row['is_chest_pain'] == 'VERDADERO',
        pain_cardiac: row['pain_cardiac'] == 'VERDADERO',
        cardiac_family_pain: row['cardiac_family_pain'] == 'VERDADERO',
        cholesterol_pain: row['cholesterol_pain'] == 'VERDADERO',
        dizzines_pain: row['dizzines_pain'] == 'VERDADERO',
        smoke_pain: row['smoke_pain'] == 'VERDADERO',
        covid_19: row['Covid 19'] == 'VERDADERO'
      }

      activity.update(activity_params)
    end
  end
end

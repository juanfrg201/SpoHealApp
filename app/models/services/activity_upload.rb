require 'csv'
module Services
  class ActivityUpload
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
        activity_params = {
          activity_type_id: Activity.find_by(identifier: row['Tipo actividad']),
          name: row['Descripción'],
          description: row['Beneficios'],
          tutorial: row['IDENTIFICADOR'],
          benefits: row['IDENTIFICADOR'],
          identifier: row['IDENTIFICADOR'],
          intensity: row['IDENTIFICADOR'],
          duration: row['IDENTIFICADOR'],
          sport_medical_restriccion: row['IDENTIFICADOR'],
          sport_muscle_pains: row['IDENTIFICADOR'],
          general_pain: row['IDENTIFICADOR'],
          is_hipertension: row['IDENTIFICADOR'],
          is_asthma: row['IDENTIFICADOR'],
          is_chest_pain: row['IDENTIFICADOR'],
          pain_cardiac: row['IDENTIFICADOR'],
          cardiac_family_pain: row['IDENTIFICADOR'],
          cholesterol_pain: row['IDENTIFICADOR'],
          dizzines_pain:row['IDENTIFICADOR'] ,
          smoke_pain: row['IDENTIFICADOR'],
          ovid_19:  row['IDENTIFICADOR']
        }
        Activity.create(activity_params)
      end
    end
    
  end
end
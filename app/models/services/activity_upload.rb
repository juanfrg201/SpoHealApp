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
          activity_type_id: ActivityType.find_by(identifier: row['Tipo actividad']).id,
          name: row['Nombre'],
          description: row['Descripcion'],
          tutorial: row['Tutorial'],
          benefits: row['beneficio'],
          identifier: row['identificador'],
          link: row['Links'].split("*"),
          intensity: row['intensidad'],
          duartion: row['duracion (min)'],
          sport_medical_restriccion: row['SportMedicalRestriccion'] == "VERDADERO" ? true : false,
          sport_muscle_pains: row['SportMusclePain'] == "VERDADERO" ? true : false,
          general_pain: row['general_pain'] == "VERDADERO" ? true : false,
          is_hipertension: row['is_hipertension'] == "VERDADERO" ? true : false,
          is_asthma: row['is_asthma'] == "VERDADERO" ? true : false,
          is_chest_pain: row['is_chest_pain'] == "VERDADERO" ? true : false,
          pain_cardiac: row['pain_cardiac'] == "VERDADERO" ? true : false,
          cardiac_family_pain: row['cardiac_family_pain'] == "VERDADERO" ? true : false,
          cholesterol_pain: row['cholesterol_pain'] == "VERDADERO" ? true : false,
          dizzines_pain: row['dizzines_pain'] == "VERDADERO" ? true : false ,
          smoke_pain: row['smoke_pain'] == "VERDADERO" ? true : false,
          covid_19: row['Covid 19'] == "VERDADERO" ? true : false
        }
        Activity.create(activity_params)
      end
    end
    
  end
end
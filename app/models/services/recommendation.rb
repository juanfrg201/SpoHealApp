module Services
  class Recommendation
    attr_accessor :user_id

    def initialize(user_id)
      @user_id = user_id
      @user_parameterization = User.find(@user_id).user_parametrization
    end

    def perform
      content_recomendation = take_activities_similares
      recomendation_colaborative = recommend_collaborative
      combination_recommendation(content_recomendation, recomendation_colaborative).sample(3)
    end

    private

    def recommend_collaborative
      recommender = Disco::Recommender.new
      data = ActivityRecomendation.all.map{ |a| {item_id: a.id, user_id: a.user_id, activity_id: a.activity_id, rating: ActivityRecomendation.ratings[a.rating]}}
      recommender.fit(data) if data.present?
      recommender_data = recommender.user_recs(@user_id) if data.present?
      activities = []
      if data.present?
        recommender_data.each do |data|
          activities << ActivityRecomendation.find(data[:item_id]).activity
        end
      end
    end

    def take_activities_similares
      user_params = @user_parameterization.attributes.slice(
        "sport_medical_restriccion",
        "sport_muscle_pains",
        "general_pain",
        "is_hipertension",
        "is_asthma",
        "is_chest_pain",
        "pain_cardiac",
        "cardiac_family_pain",
        "cholesterol_pain",
        "dizzines_pain",
        "smoke_pain",
        "covid_19"
      )

      all_activities = Activity.all
    
      actividades_similares = all_activities.map do |actividad|
        [actividad, calcular_similitud(user_params, actividad)]
      end
    
      actividades_similares.sort_by! { |actividad, similitud| similitud }.reverse!
    
      actividades_similares.map(&:first)
    end

    def calcular_similitud(user_params, actividad)
      total_features = user_params.length
      matching_features = user_params.select { |key, value| actividad[key] == value }.length
      matching_features.to_f / total_features
    end

    def combination_recommendation(content_recomendation, recomendation_colaborative)
      if content_recomendation.nil? && recomendation_colaborative.nil?
        result = [] # Ambas son nil, devuelve un array vacío
      elsif content_recomendation.nil?
        result = recomendation_colaborative # La recomendación colaborativa no es nil
      elsif recomendation_colaborative.nil?
        result = content_recomendation # La recomendación de contenido no es nil
      else
        result = (content_recomendation + recomendation_colaborative).uniq # Ambas tienen contenido
      end
    
      result
    end
  end
end
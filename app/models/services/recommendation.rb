module Services
  class Recommendation
    attr_accessor :user_id

    def initialize(user_id)
      @user_id = user_id
      @user_parameterization = User.find(@user_id).user_parametrization
    end

    def perform
      content_based_recommendations = recommend_content_based(1, 30)
      collaborative_recommendations = recommend_collaborative

      combined_recommendations = (content_based_recommendations + collaborative_recommendations).uniq

      combined_recommendations.sample(rand(3..6))
    end

    private

    def recommend_content_based(intensity, duration)
      activity_desease_filter = take_activities_deseas(@user_parameterization)
      
      activities = (activity_desease_filter.where(intensity: 0) + activity_desease_filter.where(duartion: duration)).uniq
      sorted_activities = activities_with_fitness(activities).sort_by { |activity| -activity[:fitness_score] }
      content_based_recommendations = sorted_activities.map { |activity| activity[:activity] }
      content_based_recommendations
    end

    def recommend_collaborative
      recommender = Disco::Recommender.new
      data = ActivityRecomendation.all.map{ |a| {item_id: a.id, user_id: a.user_id, activity_id: a.activity_id, rating: ActivityRecomendation.ratings[a.rating]}}
      recommender.fit(data)
      recommender_data = recommender.user_recs(@user_id)
      activities = []
      recommender_data.each do |data|
        activities << ActivityRecomendation.find(data[:item_id]).activity
      end

      activityes_filtered = filter_activity_colaborative_deseas(activities, @user_parameterization)
      sorted_activities = activities_with_fitness(activityes_filtered).sort_by { |activity| -activity[:fitness_score] }
      collaborative_recommendations = sorted_activities.map { |activity| activity[:activity] }
      collaborative_recommendations
    end

    def activities_with_fitness(activities)
      activities_with_fitness = activities.map do |activity|
        fitness_score = calculate_fitness_score(@user_parameterization.weight, @user_parameterization.height, @user_parameterization.imc, activity)
        { activity: activity, fitness_score: fitness_score }
      end
      activities_with_fitness
    end

    def calculate_fitness_score(weight, height, ibm, activity)
      activity_intensity = Activity.intensities[activity.intensity]
      activity_duration = activity.duartion

      fitness_score = (ibm.to_i * 0.4) + (activity_intensity * 0.3) + (activity_duration * 0.3)

      fitness_score
    end

    def take_activities_deseas(user_parameterization)
      Activity.where(
        sport_medical_restriccion: user_parameterization.sport_medical_restriccion,
        sport_muscle_pains: user_parameterization.sport_muscle_pains,
        general_pain: user_parameterization.general_pain,
        is_hipertension: user_parameterization.is_hipertension,
        is_asthma: user_parameterization.is_asthma,
        is_chest_pain: user_parameterization.is_chest_pain,
        pain_cardiac: user_parameterization.pain_cardiac,
        cardiac_family_pain: user_parameterization.cardiac_family_pain,
        cholesterol_pain: user_parameterization.cholesterol_pain,
        dizzines_pain: user_parameterization.dizzines_pain,
        smoke_pain: user_parameterization.smoke_pain,
        covid_19: user_parameterization.covid_19
      )
    end

    def filter_activity_colaborative_deseas(activities, user_parameterization)
      matching_activities = []

      activities.each do |activity|
        # Compara los campos de la actividad con los campos en los parámetros del usuario
        if !activity.sport_medical_restriccion == user_parameterization.sport_medical_restriccion &&
          !activity.sport_muscle_pains == user_parameterization.sport_muscle_pains &&
          !activity.general_pain == user_parameterization.general_pain &&
          !activity.is_hipertension == user_parameterization.is_hipertension &&
          !activity.is_asthma == user_parameterization.is_asthma &&
          !activity.is_chest_pain == user_parameterization.is_chest_pain &&
          !activity.pain_cardiac == user_parameterization.pain_cardiac &&
          !activity.cardiac_family_pain == user_parameterization.cardiac_family_pain &&
          !activity.cholesterol_pain == user_parameterization.cholesterol_pain &&
          !activity.dizzines_pain == user_parameterization.dizzines_pain && 
          !activity.smoke_pain == user_parameterization.smoke_pain &&
          !activity.covid_19 == user_parameterization.covid_19
          matching_activities << activity
        end
      end

      matching_activities
    end
  end
end
class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :set_recomendation
  helper_method :active_user_day_weeks
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def set_recomendation 
    @user_recommendations ||= session[:user_id].present? ? Services::Recommendation.new(session[:user_id].to_i) : nil
    @user_recommendations = @user_recommendations.perform
  end

  def active_user_day_weeks
    @user_week_active_days ||= session[:user_id].present? ? Services::ActiveDays.new(session[:user_id].to_i) : nil
    @user_week_active_days&.perform
  end

  def authenticate_user!
    redirect_to root_path unless current_user
  end
end

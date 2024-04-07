# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :set_recomendation
  helper_method :active_user_day_weeks
  helper_method :set_recomendation

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def set_recomendation(route_id: nil)
    @user_recommendations ||= if session[:user_id].present?
                                Services::Recommendation.new(session[:user_id].to_i,
                                                             route_id)
                              end
    @user_recommendations = @user_recommendations.perform
  end

  def active_user_day_weeks
    @user_week_active_days ||= session[:user_id].present? ? Services::ActiveDays.new(session[:user_id].to_i) : nil
    @user_week_active_days&.perform
  end

  def authenticate_user!
    redirect_to root_path unless current_user
  end

  def user_session!
    current_user.is_admin? ? false : true
  end

  def admin_session!
    current_user.is_admin?
  end
end

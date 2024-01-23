class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :set_recomendation
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def set_recomendation 
    @user_recommendations ||= session[:user_id].present? ? Services::Recommendation.new(session[:user_id].to_i) : nil
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end

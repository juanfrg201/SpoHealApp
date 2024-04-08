class UserActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_activity, only: [:show]
  before_action :user_session!


  def index 
    @user_activities = current_user.user_activities.map{ |a| a.activity }
  end

  def show 

  end

  def new
    @user_activity = UserActivity.new()
    @activities = Activity.all.pluck(:name, :id)
  end

  def create
    @user_activity = UserActivity.new(user_activity_params.except(:rating))
    @user_activity.rating = user_activity_params[:rating].present? ? user_activity_params[:rating].to_i - 1 : 0
    @user_activity.user_id = current_user.id
    if @user_activity.save 
      redirect_to activity_recomendations_path, notice: "Gracias por registrar tu ejercicio"
    else
      redirect_to new_user_activity_path, error: "No se pudo registrar, verifica los datos"
    end
  end

  private 

  def set_user_activity 
    @user_activity = Activity.find(params[:id])
  end

  def user_activity_params 
    params.require(:user_activity).permit(:activity_id, :rating)
  end
end

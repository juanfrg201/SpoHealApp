class UserActivitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_activity = UserActivity.new()
    @activities = Activity.all.pluck(:name, :id)
  end

  def create
    @user_activity = UserActivity.new(user_activity_params)
    @user_activity.user_id = current_user.id
    if @user_activity.save 
      redirect_to activity_recomendations_path, notice: "Gracias por registrar tu ejercicio"
    else
      redirect_to new_user_activity_path, error: "No se pudo registrar, verifica los datos"
    end
  end

  private 

  def user_activity_params 
    params.require(:user_activity).permit(:activity_id, :rating)
  end
end

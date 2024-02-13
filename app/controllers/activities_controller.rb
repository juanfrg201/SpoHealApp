class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_session! 
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def create
    if create_params[:csv_file].present?
      activities = Services::ActivityUpload.new(create_params[:csv_file])
      if activities.perform
        flash[:notice] = "Se subio correctamente el csv"
        redirect_to activities_path
      else
        flash[:error] = "No se pudo subir el archivo"
        redirect_to activities_path
      end
    end
  end

  private 

  def create_params 
    params.permit(:csv_file)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

end

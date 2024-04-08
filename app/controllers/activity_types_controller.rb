class ActivityTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_session! 

  def index
    @activity_types = ActivityType.paginate(page: params[:page], per_page: 10)
  end

  def create
    if create_params[:csv_file].present?
      activity_types = Services::ActivityTypesUpload.new(params[:csv_file])
      if activity_types.perform
        flash[:notice] = "Se subio correctamente el csv"
        redirect_to activity_types_path
      else
        flash[:error] = "No se pudo subir el archivo"
        redirect_to activity_types_path
      end
    end
  end

  def destroy
  end

  private 

  def create_params 
    params.permit(:csv_file)
  end

end

# frozen_string_literal: true

class ActivityTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_session!

  def index
    @activity_types = ActivityType.paginate(page: params[:page], per_page: 10)
  end

  def create
    return unless create_params[:csv_file].present?

    activity_types = Services::ActivityTypesUpload.new(params[:csv_file])
    if activity_types.perform
      flash[:notice] = 'Se subio correctamente el csv'
    else
      flash[:error] = 'No se pudo subir el archivo'
    end
    redirect_to activity_types_path
  end

  def destroy; end

  private

  def create_params
    params.permit(:csv_file)
  end
end

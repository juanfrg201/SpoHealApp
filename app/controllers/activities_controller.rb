# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_session!
  before_action :set_activity, only: %i[show upload_image]

  def index
    @activities = Activity.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  def create
    return unless create_params[:csv_file].present?

    activities = Services::ActivityUpload.new(create_params[:csv_file])
    if activities.perform
      flash[:notice] = 'Se subio correctamente el csv'
    else
      flash[:error] = 'No se pudo subir el archivo'
    end
    redirect_to activities_path
  end

  def upload_image
    @activity.update(upload_image_params)
    flash[:notice] = 'Se subio correctamente el csv'
    redirect_to @activity
  end

  private

  def create_params
    params.permit(:csv_file)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def upload_image_params
    params.permit(:image)
  end
end

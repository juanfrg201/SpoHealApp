class NutricionTipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :admin_session!, only: [:show]
  before_action :set_nutricion_tip, only: [:show, :upload_image]

  def index 
    @nutricion_tips = NutricionTip.paginate(page: params[:page], per_page: 10)
  end

  def create
    if create_params[:csv_file].present?
      nutricion_tips = Services::NutricionTipsUpload.new(params[:csv_file])
      if nutricion_tips.perform
        flash[:notice] = "Se subio correctamente el csv"
        redirect_to nutricion_tips_path
      else
        flash[:error] = "No se pudo subir el archivo"
        redirect_to nutricion_tips_path
      end
    end
  end

  def show
  end

  def upload_image
    @nutricion_tip.update(upload_image_params)
    flash[:notice] = "Se subio correctamente el csv"
    redirect_to @nutricion_tip
  end

  private 

  def set_nutricion_tip
    @nutricion_tip = NutricionTip.find(params[:id])
  end

  def create_params 
    params.permit(:csv_file)
  end

  def upload_image_params 
    params.permit(:image)
  end
end

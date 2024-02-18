class NutricionTipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :admin_session!, only: [:show]
  before_action :set_nutricion_tip, only: [:show]

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

  private 

  def set_nutricion_tip
    @nutricion_tip = NutricionTip.find(params[:id])
  end
end

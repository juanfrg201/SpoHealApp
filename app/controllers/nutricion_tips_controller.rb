class NutricionTipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :admin_session!, only: [:show]
  before_action :set_nutricion_tip, only: [:show]

  def index 
    
  end

  def create
  end

  def show
  end

  private 

  def set_nutricion_tip
    @nutricion_tip = NutricionTip.find(params[:id])
  end
end

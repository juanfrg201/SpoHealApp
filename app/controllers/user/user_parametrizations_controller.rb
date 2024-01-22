class User::UserParametrizationsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @user_parametrization = UserParametrization.new
  end

  def create
    @user = current_user
    @user_parametrization = @user.build_user_parametrization(user_parameterization_params)

    if @user_parametrization.save
      redirect_to home_pages_path, notice: 'Parámetros del usuario creados exitosamente.'
    else
      render :new
    end
  end

  private

  def user_parameterization_params
    params.require(:user_parametrization).permit(
      :weight, :height, :sport_medical_restriccion,
      :sport_muscle_pains, :general_pain, :is_hipertension,
      :is_asthma, :is_chest_pain, :pain_cardiac,
      :cardiac_family_pain, :cholesterol_pain,
      :dizzines_pain, :smoke_pain, :covid_19
    )
  end
end


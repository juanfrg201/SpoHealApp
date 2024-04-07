# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show update]
  before_action :set_user, only: %i[show edit update]

  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: user_params[:email])
      @user = User.new(user_params.except(:activity_type_id))
      if @user.save
        @user_activity_type = UserActivityType.create(user_id: @user.id,
                                                      activity_type_id: user_params[:activity_type_id])
        session[:user_id] = @user.id
        redirect_to new_user_user_parametrization_path(user_id: @user.id)
      else
        flash[:error] = "Error al crear el usuario. Verifique los datos: #{@user.errors}"
        redirect_to root_path
      end
    else
      session[:user_id] = nil
      flash[:error] = 'Error al crear el usuario. El correo electrónico ya está en uso.'
      redirect_to root_path
    end
  end

  def edit; end

  def show; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Perfil actualizado con éxito.'
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :years, :activity_type_id)
  end
end

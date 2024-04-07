# frozen_string_literal: true

class AdminUsersController < ApplicationController
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
        @user.add_role :admin
      else
        flash[:error] = "Error al crear el usuario. Verifique los datos: #{@user.errors}"
      end
    else
      session[:user_id] = nil
      flash[:error] = 'Error al crear el usuario. El correo electrónico ya está en uso.'
    end
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :years, :activity_type_id)
  end
end

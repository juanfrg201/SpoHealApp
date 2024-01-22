class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !User.find_by(email: user_params[:email])
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to new_user_user_parametrization_path(user_id: @user.id)
      else
        flash[:error] = 'Usuario no encontrado'
        redirect_to root_path
      end
    else
      session[:user_id] = nil
      flash[:error] = 'Correo ya usado'
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email,:password, :years)
  end
end

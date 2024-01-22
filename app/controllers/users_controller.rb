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
      flash[:error] = 'Correo ya usado'
      redirect_to root_path
    end
  end

  def login 
  end

  def authenticate
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Inicio de sesión exitoso.'
    else
      flash[:error] = 'Usuario no encontrado, por favor registrate'
      redirect_to root_path
    end
  end

  def destroy_session 
    user = User.find(params[:id])
    session[:user_id].destroy
    redirect_to root_path, notice: 'Inicio de sesión exitoso.'
  end


  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email,:password, :years)
  end
end

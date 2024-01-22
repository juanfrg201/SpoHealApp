class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Loguear al usuario después de crear la cuenta
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Usuario creado exitosamente.'
    else
      redirect_to root_path, error: 'Error'
    end
  end

  def login 
  end

  def authenticate
    user = User.find_by(email: params[:email])

    if user
      # Iniciar sesión y redirigir a la página principal
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Inicio de sesión exitoso.'
    else
      # Mostrar mensaje de error y volver a la página de login
      flash.now[:alert] = 'Email o contraseña incorrectos.'
      redirect_to root_path, error: 'Usuario no encontrador'
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

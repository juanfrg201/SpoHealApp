class UserRoutesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user_route = UserRoute.new()
    @route = Route.find(params[:route_id])
  end

  def create
    @route = Route.find(params[:route_id])
    user_route = UserRoute.new(user_id: current_user.id, route_id: @route.id , start_date: Date.today, active: true)
    if user_route.save 
      redirect_to root_path, notice: 'Ruta creada con éxito.'
    else
      flash[:error] = 'Error al crear la ruta '
      redirect_to root_path
    end
  end
end

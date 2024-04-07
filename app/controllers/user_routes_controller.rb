# frozen_string_literal: true

class UserRoutesController < ApplicationController
  before_action :authenticate_user!

  def index
    @route = current_user.user_routes.present? ? current_user.user_routes.last : nil
    @activities = set_recomendation(route_id: @route.id)
  end

  def new
    @user_route = UserRoute.new
    @route = Route.find(params[:route_id])
  end

  def create
    @route = Route.find(params[:route_id])
    user_route = UserRoute.new(user_id: current_user.id, route_id: @route.id, start_date: Date.today, active: true)
    if user_route.save
      redirect_to root_path, notice: 'Ruta creada con éxito.'
    else
      flash[:error] = 'Error al crear la ruta '
      redirect_to root_path
    end
  end

  def inactive
    @route = UserRoute.find(params[:id])
    if @route.update(active: false, end_date: Date.today)
      redirect_to routes_path, notice: 'Se inactivo la ruta , crea una ruta para continuar con tu proceso'
    else
      flash[:error] = 'Error al descativar la ruta'
      redirect_to user_routes_path
    end
  end
end

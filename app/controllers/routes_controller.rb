# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_session!, only: %i[new create]
  before_action :set_routes, only: [:show]

  def index
    routes = Route.group(:level).pluck(Arel.sql('MIN(id)'))
    @user_principal_routes = Route.where(id: routes)
  end

  def show; end

  def new; end

  def create; end

  private

  def set_routes
    @route = Route.find(params[:id])
    @routes = Route.where(level: @route.level)
  end
end

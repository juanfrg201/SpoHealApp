class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @recomendations = set_recomendation
  end
end

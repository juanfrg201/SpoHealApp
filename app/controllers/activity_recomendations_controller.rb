class ActivityRecomendationsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_session!
  before_action :user_parameterization!

  def index
    @recommendation = set_recomendation
  end
  
end

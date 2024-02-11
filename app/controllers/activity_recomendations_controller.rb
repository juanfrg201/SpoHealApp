class ActivityRecomendationsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_session!

  def index
  end
  
end

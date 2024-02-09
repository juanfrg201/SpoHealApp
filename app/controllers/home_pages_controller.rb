class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @active_days = active_user_day_weeks.pluck(:day)
  end
end

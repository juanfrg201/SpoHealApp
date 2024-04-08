class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @active_days = active_user_day_weeks.pluck(:day)
    @nutricions = NutricionTip.all.sample(3)
  end
end

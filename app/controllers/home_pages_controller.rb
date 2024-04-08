class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :user_parameterization!, only: [:index]

  def index
    @active_days = active_user_day_weeks.pluck(:day)
    @nutricions = NutricionTip.all.sample(3)
    if current_user.is_admin?
      notification_service = Services::SendNotification.new
      notification_service.perform
    end
  end
end

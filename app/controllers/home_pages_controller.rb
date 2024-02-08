class HomePagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @active_days = active_user_day_weeks.pluck(:day)
    vapid_key = WebPush.generate_key
    WebPushNotification.create(user_id: User.fisrt.id, auth_key: vapid_key.private_key  , p256dh_key: vapid_key.public_key )
  end
end

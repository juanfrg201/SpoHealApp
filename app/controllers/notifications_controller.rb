class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create 
    @notification = WebPushNotification.new(endpoint: params[:endpoint], auth_key: params[:keys][:auth], p256dh_key: params[:keys][:p256dh] )
    if @notification.save 
      render json: @notification
    else 
      render json: @notification.errors.full_messages
    end
  end
end

class UserStadisticsController < ApplicationController
  def index
    @user_activities = UserActivity.where(created_at: 1.week.ago.beginning_of_week..Time.now.end_of_week).group("date_trunc('week', created_at)").count
    @user_activities_by_rating = UserActivity.group(:rating).count
  end
end

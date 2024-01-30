class AddUserReferenceToWebPushNotification < ActiveRecord::Migration[7.1]
  def change
    add_reference :web_push_notifications, :user, null: false, foreign_key: true
  end
end

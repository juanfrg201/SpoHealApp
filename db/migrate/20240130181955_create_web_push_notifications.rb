class CreateWebPushNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :web_push_notifications do |t|
      t.string :endpoint
      t.string :auth_key
      t.string :p256dh_key

      t.timestamps
    end
  end
end

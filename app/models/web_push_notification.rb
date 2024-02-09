class WebPushNotification < ApplicationRecord
  belongs_to :user

  def send_message(message)
    WebPush.payload_send(message: message, endpoint: endpoint, p256dh: p256dh_key, auth: auth_key, vapid: { private_key: "1RVcXnTjZzPFycE8gS04aL1rOuF8AlMJZjcuqzLOdkm=", public_key: "BEwam3uGmhVbiFaA5XhbcDL7ykh85fq2e7IvNAgy_ZvfnpUukPAzV_DnyZlEb2q017tR9zoKZTzpybOgARgoBgU=" } )
  end
end

class WebPushNotification < ApplicationRecord
  def send_message(message)
    WebPush.payload_send(message: message, endpoint: endpoint, p256dh: p256dh_key, auth: auth_key, vapid: { private_key: "S1UtpmB_I5z9mShPqGwmA3wbpl95kt3Rx-g6OwpzWFg=", public_key: "BPMbVQ468w_BTchC4DszPnpf0b3zcebhetPhr9CBecXS20PmDSQ5HVuVQie1-hU6WIXpUywq9gzeusYw0O10hTs=" } )
  end
end

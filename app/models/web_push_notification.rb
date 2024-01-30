class WebPushNotification < ApplicationRecord
  belongs_to :user

  def send_message(message)
    WebPush.payload_send(message: message, endpoint: endpoint, p256dh: p256dh_key, auth: auth_key, vapid: { private_key: "xJaeHX3_0isyOows1SixOoleif8CURXNBuCkbu2pDAM=", public_key: "BDea7ebh7izOOWNuZWdNyL5dZoodZo_OeIULi4rxs4wku8sqvhXYqUs027vJE9hjF-iwSIRbYuINW4btM-XZgoc=" } )
  end
end

class WebPushNotification < ApplicationRecord
  belongs_to :user

  def send_message(message)
    WebPush.payload_send(message: message, endpoint: endpoint, p256dh: p256dh_key, auth: auth_key, vapid: { private_key: "2t5qtUqrbrVWwusdafS8P8TyFXa4Z6lB-ypsSI1k13E=", public_key: "BJG7SDVTBamvuvqQkrtYBhjuf8gY8Ckki64fT86GGd3JD_Sxmv3v2lebdwen7sOw7uBHswXnkfeCuO3_ekA7D80=" } )
  end
end

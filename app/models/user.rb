class User < ApplicationRecord
  rolify
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true
  validates :last_name, presence: true
  validates :years, presence: true
  has_one :user_parametrization
  has_many :active_days
  has_many :activity_recomendations
  has_many :communities
  has_many :community_posts
  has_many :user_activities
  has_many :webpush_subscriptions
  has_many :user_activity_types
  has_many :user_routes

  after_create :notify_users

  def authenticate(password)
    self.password == password ? true : false
  end

  def is_admin? 
    self.has_role? :admin
  end

  def self.regular_all_user
    User.where.not(id: User.with_role(:admin).pluck(:id))
  end

  def notify_users
    ActionCable.server.broadcast("notifications_channel", {
        title: "Hola gracias por ingresar",
        body: "Siuuuu"
    })
  end


  def notyfy(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    user_number = "+57"+self.user.phone_number
    message = @client.messages.create(
      body: messagegit add,
      from: ENV['CELL_PHONE_TWILIO'],
      to: user_number
    )

    puts message.sid
  end
end

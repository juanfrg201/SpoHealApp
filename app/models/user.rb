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


  def notify(message)
    account_sid = 'AC42caecc04769cc29be43080a899c31ac'
    auth_token = 'a9a8f0a1d2d2253b08942cb8d0bbbe80'
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    if self.phone.present?
      user_number = "+57#{self.phone.to_s}"
      message = @client.messages.create(
        body: message,
        from: '+13343731781',
        to: user_number
      )
    end
  end
end

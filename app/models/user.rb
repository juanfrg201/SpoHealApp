class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  has_one :user_parametrization
  has_many :active_days
  has_many :activity_recomendations
  has_many :communities
  has_many :community_posts
  has_many :user_activities

  def authenticate(password)
    self.password == password ? true : false
  end
end

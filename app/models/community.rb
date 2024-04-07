# frozen_string_literal: true

class Community < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :community_posts

  validates :issue, presence: true
  validates :name, presence: true
end

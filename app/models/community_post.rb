# frozen_string_literal: true

class CommunityPost < ApplicationRecord
  belongs_to :user
  belongs_to :community
end

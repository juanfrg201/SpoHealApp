# frozen_string_literal: true

class ActivityRecomendationsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_session!

  def index
    @recommendation = set_recomendation
  end
end

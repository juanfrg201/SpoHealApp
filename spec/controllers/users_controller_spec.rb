# spec/controllers/users_controller_spec.rb

require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end
end
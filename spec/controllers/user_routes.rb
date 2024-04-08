# spec/controllers/user_routes_controller_spec.rb
require 'rails_helper'

RSpec.describe UserRoutesController, type: :controller do
  describe "GET #index" do
    it "returns http success when user is authenticated" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      session[:user_id] = user.id
      
      route = Route.create(presure: "alta", level: "intenso", description: "Una ruta en donde el nivel de ejercicios he intensidad es alto , y el nivel de presion es alto")
      get :index

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns good response" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      session[:user_id] = user.id
      
      route = Route.create(presure: "alta", level: "intenso", description: "Una ruta en donde el nivel de ejercicios he intensidad es alto , y el nivel de presion es alto")
      get :new, params: { route_id: route.id }

      expect(response).to be_successful
    end
  end
end

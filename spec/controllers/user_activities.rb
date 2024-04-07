# spec/controllers/user_routes_controller_spec.rb
require 'rails_helper'

RSpec.describe UserActivitiesController, type: :controller do
  describe "GET #index" do
    it "returns http success when user is authenticated" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      session[:user_id] = user.id

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns good response" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      session[:user_id] = user.id
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns good response" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      activity_type = ActivityType.create(name: "Prioriza las frutas y verduras", benefits: "Mejoran la salud cardiovascular, aumentan la resistencia, queman calorías, reducen el riesgo de enfermedades cardíacas, y mejoran el estado de ánimo.\nMejora la salud  del corazón y los pulmones \nReduce el riesgo de enfermedades cardíacas, accidentes cerebrovasculares y diabetes \nAyuda a mantener un peso saludable \nMejora la calidad del sueño\n Reduce el estrés y la ansiedad ", identifier: "TA1")
      activity = Activity.create(activity_type_id: activity_type.id, name: "Postura de la montaña:", description: "Párate derecho con los pies juntos, las piernas rectas y los hombros hacia atrás. Levanta los brazos por encima de la cabeza y junta las palmas. Mantén la postura durante unos segundos.",benefits: "Fortalece los músculos de la espalda.\r\nMejora la postura.\r\nReduce el riesgo de lesiones.", intensity: "Intermedia", duartion: 10, link: ["https://www.mayoclinic.org/es/healthy-lifestyle/stress-management/multimedia/mountain-pose/vid-20453579#:~:text=P%C3%A1rate%20con%20la%20espalda%20recta,con%20las%20palmas%20hacia%20adentro."] )
      user_activity = UserActivity.create(user_id: user.id, activity_id: activity.id)
      session[:user_id] = user.id
      get :show, params: { id: activity.id }
      expect(response).to be_successful
    end
  end

  
end
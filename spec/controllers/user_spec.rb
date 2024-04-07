require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  
  describe "GET #show" do
    it "returns a success response" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "assigns the requested user to @user" do
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      get :edit, params: { id: user.id }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    before do
      # Definir el usuario actual para simular el comportamiento de current_user
      @current_user = User.create(email: "test@example.com", password: "password")
      allow(controller).to receive(:current_user).and_return(@current_user)
    end
    
    it "updates the user and redirects to user path" do
      # Crear un usuario para actualizar
      user = User.create(email: "juanfe@gmail.com", password: "feliper1972", name: "Felipe", last_name: "Ruiz", years: "21")
      
      user_params = {
        user: {
          name: "Updated Name",
          last_name: "Updated Last Name"
        }
      }
      
      # Envía una solicitud PATCH para actualizar el usuario con los parámetros de actualización
      patch :update, params: { id: user.id, user: user_params[:user] }
  
      # Verifica si la respuesta es exitosa
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new user and redirects to user parametrization path" do
        user_params = {
          user: {
            name: "John",
            last_name: "Doe",
            email: "john@example.com",
            password: "password",
            years: "30",
            activity_type_id: 1
          }
        }

        expect {
          post :create, params: user_params
        }.to change(User, :count).by(1)

        expect(response).to redirect_to(new_user_user_parametrization_path(user_id: User.last.id))
        expect(session[:user_id]).to eq(User.last.id)
      end
    end
  end
end
  
require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  it "logs the user in after sign up" do
    post :create, user: new_user_attributes
    expect(session[:user_id]).to eq assigns(:user).id
  end

  describe "not signed in" do

    let(:factory_user) { create(:user) }

    before do
      post :create, user: new_user_attributes
    end

    it "returns http success" do
      get :show, {id: factory_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: factory_user.id}
      expect(response).to render_template :show
    end

    it "assigns factory_user to @user" do
      get :show, {id: factory_user.id}
      expect(assigns(:user)).to eq(factory_user)
    end
  end

end

require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      @advertisement  = Advertisement.create(title: "first ad", body: "This is the coolest ad ever! Read it", price: 10000)
      #@advertisement.save
      #puts @advertisement.id
      get :show, id: @advertisement.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, advertisement: {title: "first ad", body: "This is the coolest ad ever! Read it", price: 10000}
      expect(response).to have_http_status(:found)
    end
  end

end

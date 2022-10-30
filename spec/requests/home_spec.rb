require 'rails_helper'

RSpec.describe "Homes", type: :request do
  before do
    user = User.create(name: 'Michal', surname: 'Kasperek', email: 'michal.kasperek@example.com', password: 'password', password_confirmation: 'password', credit_card: '12345678901', address: 'Lodz').save
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end
  describe "GET /index" do
    it "returns http success" do
      get "/home/add"
      expect(response.status).to eq(200)
  end
end
end

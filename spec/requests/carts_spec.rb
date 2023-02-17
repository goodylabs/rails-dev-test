require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET #show" do
    it "have http status success" do
      get "/carts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "resets the session cart_id to nil" do
      cart = FactoryBot.create(:cart)
      delete cart_path(cart)
      expect(session[:cart_id]).to be_nil
    end

    it "redirects to the root path" do
      cart = FactoryBot.create(:cart)
      delete cart_path(cart)
      expect(response).to redirect_to(root_path)
    end
  end
end

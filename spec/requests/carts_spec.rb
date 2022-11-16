require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }

  describe 'GET /users/:user_id/carts/:id' do
    context 'as a guest' do
      it 'has a 302 status code' do
        get user_cart_path(user_id: user.id, id: cart.id)
        expect(response).to have_http_status(:found)
      end
    end

    context 'as an user' do
      before do
        sign_in user
      end

      it 'has a 200 status code' do
        get user_cart_path(user_id: user.id, id: cart.id)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

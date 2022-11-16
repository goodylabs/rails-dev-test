require 'rails_helper'
require 'byebug'

RSpec.describe 'Orders', type: :request do
  let(:user) { create(:user) }
  let(:order_attributes) { attributes_for :order }
  let(:req) { subject }

  describe 'GET /users/:user_id/orders' do
    context 'as a guest' do
      it 'has a 302 status code' do
        get user_orders_path(user_id: user.id)
        expect(response).to have_http_status(:found)
      end
    end

    context 'as an user' do
      before do
        sign_in user
      end

      it 'has a 200 status code' do
        get user_orders_path(user_id: user.id)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST /users/:user_id/orders' do
    context 'as a guest' do
      subject do
        post user_orders_path(user_id: user.id)
      end

      it 'does not create an order' do
        expect { req }.to change(Order, :count).by(0)
      end
    end

    context 'as an user' do
      subject do
        post user_orders_path(user_id: user.id)
      end

      before do
        sign_in user
        user.address = 'address'
      end

      it 'creates an order' do
        expect { req }.to change(Order, :count).by(1)
      end
    end
  end
end

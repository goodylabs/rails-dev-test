require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }

  describe 'GET /products' do
    context 'as a guest' do
      it 'has a 302 status code' do
        get products_path
        expect(response).to have_http_status(:found)
      end
    end

    context 'as an user' do
      before do
        sign_in user
      end

      it 'has a 200 status code' do
        get products_path
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

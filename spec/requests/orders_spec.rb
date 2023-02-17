require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe 'GET #index' do
    it 'renders index template' do
      get orders_path
      expect(response).to render_template :index
    end

    it 'assigns all orders to @orders' do
      order1 = FactoryBot.create(:order)
      order2 = FactoryBot.create(:order)
      get orders_path
      expect(assigns(:orders)).to match_array([order1, order2])
    end
  end

  describe 'GET #show' do
    let(:order) { FactoryBot.create(:order) }

    it 'renders show template' do
      get order_path(order)
      expect(response).to render_template :show
    end

    it 'assigns the requested order to @order' do
      get order_path(order)
      expect(assigns(:order)).to eq(order)
    end
  end

  describe 'GET #new' do
    it 'renders new template' do
      get new_order_path
      expect(response).to render_template :new
    end

    it 'assigns a new order to @order' do
      get new_order_path
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe 'POST #create' do
    let(:cart) { FactoryBot.create(:cart) }
    let(:product) { FactoryBot.create(:product) }
    let(:line_item) { FactoryBot.create(:line_item, cart: cart, product: product) }

    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          order: {
            credit_card_number: '1234567890123456',
            email: 'user@example.com',
            address: '123 Main St',
          }
        }
      end

      it 'creates a new order' do
        expect {
          post orders_path, params: valid_attributes
        }.to change(Order, :count).by(1)
      end

      it 'assigns the newly created order to @order' do
        post orders_path, params: valid_attributes
        expect(assigns(:order)).to be_an_instance_of(Order)
        expect(assigns(:order)).to be_persisted
      end

      it 'redirects to the created order' do
        post orders_path, params: valid_attributes
        expect(response).to redirect_to(Order.last)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          order: {
            credit_card_number: '',
            email: '',
            address: '',
          }
        }
      end

      it 'does not create a new order' do
        expect {
          post orders_path, params: invalid_attributes
        }.to_not change(Order, :count)
      end

      it 're-renders the new template' do
        post orders_path, params: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end
end

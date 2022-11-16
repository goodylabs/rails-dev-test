require 'rails_helper'
require 'byebug'

RSpec.describe 'ProductOrders', type: :request do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }
  let(:product) { create(:product) }
  let(:product_order) { create(:product_order, product: product, cart: cart) }
  let(:product_order_attributes) { attributes_for :product_order }
  let(:req) { subject }

  describe 'DELETE /users/:user_id/carts/:cart_id/product_orders/:id' do
    context 'as a guest' do
      subject do
        delete user_cart_product_order_path(user_id: user.id, cart_id: cart.id, id: product_order.id)
      end

      before do
        product_order
      end

      it 'does not delete a product order' do
        expect { req }.to change(ProductOrder, :count).by(0)
      end
    end

    context 'as an user' do
      subject do
        delete user_cart_product_order_path(user_id: user.id, cart_id: cart.id, id: product_order.id), params: {
          format: :js
        }
      end

      before do
        sign_in user
        product_order
      end

      it 'deletes a product order' do
        expect { req }.to change(ProductOrder, :count).by(-1)
      end
    end
  end

  describe 'POST /products/:product_id/product_orders' do
    context 'as a guest' do
      subject do
        post product_product_orders_path(product_id: product.id),
             params: {
               product_order: product_order_attributes,
               format: :js
             }
      end

      before do
        product_order_attributes[:cart_id] = cart.id
        product_order_attributes[:product_id] = product.id
      end

      it 'doesn not create a product order' do
        expect { req }.to change(ProductOrder, :count).by(0)
      end
    end

    context 'as an user' do
      subject do
        post product_product_orders_path(product_id: product.id),
             params: {
               product_order: product_order_attributes,
               format: :js
             }
      end

      before do
        sign_in user
        product_order_attributes[:cart_id] = cart.id
        product_order_attributes[:product_id] = product.id
      end

      it 'creates a product order' do
        expect { req }.to change(ProductOrder, :count).by(1)
      end
    end
  end
end

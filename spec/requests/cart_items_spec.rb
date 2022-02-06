require 'rails_helper'

RSpec.describe "CartItems", type: :request do
  describe "POST /cart_items" do
    let(:do_request) { post '/cart_items', params: params }
    let(:product) { create(:product) }

    context 'when cart exists' do
      before do
        allow_any_instance_of(ApplicationController).to receive(:cart_identifier).and_return(cart.identifier)
      end

      context 'when cart is empty' do
        let(:cart) { create(:cart) }
        let(:params) do
          {
            product_id: product.id,
            quantity: 2
          }
        end
  
        it 'should add new product to cart' do        


          do_request

          cart.reload

          aggregate_failures do
            expect(cart.cart_items.count).to eq 1
            expect(cart.cart_items.first.quantity).to eq 2
            expect(cart.cart_items.first.price_cents).to eq product.price_cents * 2
            expect(cart.cart_items.first.price_currency).to eq product.price_currency
          end
        end
  
        it 'should display expected flash message' do        
          do_request
  
          expect(flash[:notice]).to be
        end
      end

      context 'when product already exists in cart' do
        let(:cart) { create(:cart, number_of_items: 3) }

        let(:params) do
          {
            product_id: cart.cart_items.first.product_id,
            quantity: 2
          }
        end
  
        it 'should change quantity of existing product' do        
          do_request

          cart.reload

          aggregate_failures do
            expect(cart.cart_items.count).to eq 3
            expect(cart.cart_items.first.quantity).to eq 3
            expect(cart.cart_items.first.price_cents).to eq product.price_cents * 3
            expect(cart.cart_items.first.price_currency).to eq product.price_currency
          end
        end
  
        it 'should display expected flash message' do        
          do_request
  
          expect(flash[:notice]).to be
        end
      end
    end
  end
end

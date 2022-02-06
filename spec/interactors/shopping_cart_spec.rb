require 'rails_helper'

RSpec.describe ShoppingCart do
  subject(:shopping_cart) { described_class.new(cart.identifier) }

  describe '#items_count' do
    context 'without cart items' do
      let(:cart) { create(:cart) }

      it 'should return 0' do
        expect(shopping_cart.items_count).to eq 0
      end
    end

    context 'with cart items' do
      let(:cart) { create(:cart, number_of_items: 3) }

      context 'when all cart items have only 1 product' do
        it 'returns expected number of products' do
          expect(shopping_cart.items_count).to eq 3
        end
      end

      context 'when cart items have multiple products' do
        before do
          cart.cart_items.first.update(quantity: 2)
        end
  
        it 'returns expected number of products' do
          expect(shopping_cart.items_count).to eq 4
        end
      end
    end
  end
end

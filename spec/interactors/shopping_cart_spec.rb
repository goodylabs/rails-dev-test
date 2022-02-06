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

  describe '#items' do
    context 'without cart items' do
      let(:cart) { create(:cart) }

      it 'should return empty result' do
        expect(shopping_cart.items).to be_empty
      end
    end

    context 'with cart items' do
      let(:cart) { create(:cart, number_of_items: 3) }

      it 'returns expected items' do
        expect(shopping_cart.items).to eq cart.cart_items
      end
    end
  end

  describe '#value' do
    context 'without cart items' do
      let(:cart) { create(:cart) }
      let(:expected_value) { Money.new(0) }

      it 'should return 0' do
        expect(shopping_cart.value).to eq expected_value
      end
    end

    context 'with cart items' do
      let(:cart) { create(:cart, number_of_items: 3) }
      let(:expected_value) { Money.new(3000) }

      it 'returns expected value' do
        expect(shopping_cart.value).to eq expected_value
      end
    end
  end
end

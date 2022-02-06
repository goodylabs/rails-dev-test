require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe 'status' do
    let(:cart) { build(:cart, status: status) }

    context 'allowed status' do
      [:new, :abandoned, :purchased].each do |status|
        let(:status) { status }

        it { expect(cart.valid?).to be true }
      end
    end
  end

  describe '#count_products' do

    context 'without cart items' do
      let(:cart) { create(:cart) }

      it 'should return 0' do
        expect(cart.count_products).to eq 0
      end
    end

    context 'with cart items' do
      let(:cart) { create(:cart, number_of_items: 3) }

      context 'when all cart items have only 1 product' do
        it 'returns expected number of products' do
          expect(cart.count_products).to eq 3
        end
      end

      context 'when cart items have multiple products' do
        before do
          cart.cart_items.first.update(quantity: 2)
        end
  
        it 'returns expected number of products' do
          expect(cart.count_products).to eq 4
        end
      end
    end

    
  end
end

require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  subject(:example_product_order) { create(:product_order, product: product, order: order) }

  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:order) { create(:order, user: user) }
  let(:cart) { create(:cart, user: user) }

  it 'is valid with valid attributes' do
    expect(example_product_order).to be_valid
  end

  it 'is invalid without product' do
    example_product_order.product_id = nil
    expect(example_product_order).not_to be_valid
  end

  it 'is invalid without cart and order' do
    example_product_order.cart_id = nil
    example_product_order.order_id = nil
    expect(example_product_order).not_to be_valid
  end

  it 'is invalid without quantity' do
    example_product_order.quantity = nil
    expect(example_product_order).not_to be_valid
  end
end

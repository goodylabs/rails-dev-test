require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:example_product) { create(:product) }

  it 'is valid with valid attributes' do
    expect(example_product).to be_valid
  end

  it 'is invalid without quantity' do
    example_product.quantity = nil
    expect(example_product).not_to be_valid
  end

  it 'is invalid without category' do
    example_product.category = nil
    expect(example_product).not_to be_valid
  end

  it 'is invalid without description' do
    example_product.description = nil
    expect(example_product).not_to be_valid
  end

  it 'is invalid without name' do
    example_product.name = nil
    expect(example_product).not_to be_valid
  end

  it 'is invalid without price' do
    example_product.price = nil
    expect(example_product).not_to be_valid
  end
end

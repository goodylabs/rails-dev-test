require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject(:example_cart) { create(:cart, user_id: user.id) }

  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(example_cart).to be_valid
  end

  it 'is invalid without user' do
    example_cart.user_id = nil
    expect(example_cart).not_to be_valid
  end
end

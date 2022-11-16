require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:example_order) { create(:order, user: user) }

  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(example_order).to be_valid
  end

  it 'is invalid without user' do
    example_order.user_id = nil
    expect(example_order).not_to be_valid
  end
end

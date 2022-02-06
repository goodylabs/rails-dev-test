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
end

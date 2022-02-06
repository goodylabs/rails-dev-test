require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'status' do
    let(:order) { Cart.new(status: status) }

    context 'with allowed status' do
      %i[new in_progress, waiting_for_payment, waiting_for_delivery closed abandoned].each do |status|
        let(:status) { status }

        it { expect(order.valid?).to be true }
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "Checkouts", type: :request do
  describe "POST /checkout" do
    let(:do_request) { post '/checkout' }

    context 'when order does not exist' do
      let(:cart) { create(:cart, number_of_items: 3) }

      before do
        allow_any_instance_of(ApplicationController).to receive(:cart_identifier).and_return(cart.identifier)
      end

      it 'should create new order' do
        do_request

        order = cart.reload.order

        aggregate_failures do
          expect(order.value).to eq(Money.new(3000, 'PLN'))
          expect(order.status).to eq 'new'
        end
      end
    end
  end
end

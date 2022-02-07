require 'rails_helper'

RSpec.describe "Checkouts", type: :request do
  let(:cart) { create(:cart, number_of_items: 3) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:cart_identifier).and_return(cart.identifier)
  end

  describe "POST /checkout" do
    let(:do_request) { post '/checkout' }

    context 'when order does not exist' do
      it 'should create new order' do
        do_request

        checkout = cart.checkout

        aggregate_failures do
          expect(checkout.status).to eq 'new'
          expect(response).to redirect_to '/checkout/customer_details'
        end
      end
    end
  end

  describe 'PATCH /checkout(/:step)' do
    # TODO 
  end
end

require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  let(:product) { FactoryBot.create(:product) }
  let(:cart) { FactoryBot.create(:cart) }
  let!(:line_item) { FactoryBot.create(:line_item, cart: cart, product: product) }

  describe "POST #create" do
    context "when the product is already in the cart" do
      it "increments the quantity of the line item" do
        post line_items_path, params: { product_id: product.id }
        expect(assigns(:line_item).quantity).to eq(1)
      end
    end

    context "when the product is not in the cart" do
      it "creates a new line item" do
        expect {
          post line_items_path, params: { product_id: FactoryBot.create(:product).id }
        }.to change(LineItem, :count).by(1)
      end
    end

    it "redirects to the cart page" do
      post line_items_path, params: { product_id: product.id }
      expect(response).to redirect_to(cart_path(assigns(:current_cart)))
    end
  end

  describe "DELETE #destroy" do
    it "deletes the line item" do
      expect {
        delete line_item_path(line_item)
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the cart page" do
      delete line_item_path(line_item)
      expect(response).to redirect_to(cart_path(assigns(:current_cart)))
    end
  end
end

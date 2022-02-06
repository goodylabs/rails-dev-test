# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    product_id = cart_item_params[:product_id]
    quantity = cart_item_params[:quantity]

    result = current_cart.add_item(
      product_id: product_id,
      quantity: quantity
    )

    redirect_back(fallback_location: root_path)

    if result.success?
      flash[:notice] = 'Dodano produkt'
    else
      flash[:alert] = result.failure[:message]
    end
  end

  private

  def cart_item_params
    params.permit(:product_id, :quantity)
  end
end

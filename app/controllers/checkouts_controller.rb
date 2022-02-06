# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    build_order

    redirect_to checkout_path(step: 'a')
  end

  def edit; end

  def build_order
    @order ||= Checkout.new(current_cart).order
  end
end

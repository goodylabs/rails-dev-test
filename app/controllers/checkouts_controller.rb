# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    build_order

    redirect_to checkout_path(step: 'customer_details')
  end

  def edit
    render params['step']
  end

  def build_order
    @order ||= CheckoutProcess.new(current_cart).order
  end
end

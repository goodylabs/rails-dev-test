# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    build_checkout

    redirect_to checkout_path(step: @checkout_process.current_step.name)
  end

  def edit
    build_checkout

    @checkout = @checkout_process.checkout
    current_step = @checkout_process.current_step

    @form = current_step.form.new(current_step.checkout_details) if current_step.with_form?

    render current_step.view_template
  end

  def update
    build_checkout

    @checkout_process.start_checkout! if @checkout_process.first_step?

    @checkout = @checkout_process.checkout
    current_step = @checkout_process.current_step

    @form = current_step.form.new(checkout_params)

    if @form.valid?
      current_step.update_checkout(@form)

      redirect_to checkout_path(step: @checkout_process.next_step.name)
    else

      render current_step.view_template
    end
  end

  def make_payment
    build_checkout

    result = @checkout_process.create_order

    if result.success?
      @checkout_process.finish_checkout!
      order = result.value!
      redirect_to orders_path(id: order.id)
    end
  end

  private

  def build_checkout
    @checkout_process ||= CheckoutProcess.new(step: params[:step], shopping_cart: current_cart)
  end

  def checkout_params
    params.require(:checkout).permit!
  end
end

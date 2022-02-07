# frozen_string_literal: true

class CheckoutProcess
  include Dry::Monads[:result]
  attr_reader :shopping_cart, :step
  attr_accessor :order, :checkout

  def initialize(shopping_cart:, step: nil)
    @shopping_cart = shopping_cart
    @step = step
    # @order = build_order
    @checkout = build_checkout
  end

  def current_step
    available_steps[step] || first_step
  end

  def next_step
    next_step_name = step_names[current_step_id + 1]
    available_steps[next_step_name] || current_step
  end

  def previous_step
    if first_step?
      current_step
    else
      previous_step_name = step_names[current_step_id - 1]
      available_steps[previous_step_name]
    end
  end

  def first_step?
    step == step_names.first || step.nil? || checkout.nil?
  end

  def start_checkout!
    # TOOD
    # move to a service class

    @checkout.update!(status: :in_progress)
  end

  def finish_checkout!
    # TOOD
    # move to a service class

    @checkout.update!(status: :finished)
  end

  def create_order
    CheckoutProcess::Services::CreateOrder.new.call(shopping_cart: shopping_cart)
  end

  private

  def build_checkout
    create_checkout unless shopping_cart.cart.checkout
    shopping_cart.cart.checkout
  end

  def create_checkout
    result = CheckoutProcess::Services::CreateCheckout.new.call(shopping_cart: shopping_cart)
    result.value!
  end

  def step_names
    available_steps.keys
  end

  def current_step_id
    available_steps.keys.index(current_step.name)
  end

  def first_step
    available_steps[step_names.first]
  end

  def available_steps
    {
      'customer_details' => CheckoutProcess::Steps::CustomerDetails.new(self),
      'delivery_address' => CheckoutProcess::Steps::DeliveryAddress.new(self),
      'payment_info' => CheckoutProcess::Steps::PaymentInfo.new(self),
      'summary' => CheckoutProcess::Steps::Summary.new(self),
      'payment' => CheckoutProcess::Steps::Payment.new(self)
    }.freeze
  end

  # def build_order
  #   create_order unless shopping_cart.cart.order
  #   shopping_cart.cart.order
  # end


end

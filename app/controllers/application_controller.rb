# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    shopping_cart = ShoppingCart.new(cart_identifier)
    set_cart_identifier(shopping_cart.cart.identifier) if cart_identifier.blank?
    shopping_cart
  end

  private

  def cart_identifier
    session[:cart_identifier]
  end

  def set_cart_identifier(_cart_identifier)
    session[:cart_identifier] = shopping_cart.cart.identifier
  end
end

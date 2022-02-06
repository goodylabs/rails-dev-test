# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    @_current_cart = find_cart || Cart.new
  end

  private

  def find_cart
    return if session[:cart_identifier].blank?

    Cart.where(identifier: identifier).first
  end
end

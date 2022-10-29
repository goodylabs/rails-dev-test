class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_render_cart
  before_action :initialize_cart
  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
      @cart ||= Cart.find_by(id: session[:cart_id])

      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
  end
end
  #devise for users
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name, :surname, :address, :credit_card, :password, :password_confirmation])
    added_attrs = [:email, :name, :surname, :address, :credit_card, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password]
  end
end

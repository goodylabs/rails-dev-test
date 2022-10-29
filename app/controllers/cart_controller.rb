class CartController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:quantity)
      redirect_to root_path, notice: " Next #{@product.name} has been added to the cart #{quantity} pieces."
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:quantity)
      redirect_to root_path, notice: "Product has been successfuly added to the cart: #{@product.name} X #{quantity}"

    end

  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    redirect_to show_cart_path, alert: "Product has been deleted from the cart."
  end
end

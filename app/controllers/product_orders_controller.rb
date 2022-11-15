class ProductOrdersController < ApplicationController
  load_and_authorize_resource

  def destroy
    # byebug
    @cart = current_user.cart
    @product_order.destroy
    respond_to do |format|
      format.js { render 'carts/product_orders_list.js.erb', layout: false }
    end
  end

  private

  def product_orders_params
    params.require(:product_order).permit(
      :quantity
    )
  end
end

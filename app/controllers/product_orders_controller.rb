class ProductOrdersController < ApplicationController
  load_and_authorize_resource

  def create
    @products = Product.all
    product_orders_svc = ProductOrdersService.new(product_order_params)
    if product_orders_svc.create_or_update
      redirect_to products_path, notice: t('.add_to_cart')
    else
      @product_order = product_orders_svc.product_order
      respond_to do |format|
        format.js { render 'products/product_tile.js.erb', layout: false }
      end
    end
  end

  def destroy
    @cart = current_user.cart
    @product_order.destroy
    respond_to do |format|
      format.js { render 'carts/product_orders_list.js.erb', layout: false }
    end
  end

  private

  def product_order_params
    params.require(:product_order).permit(
      :cart_id,
      :product_id,
      :quantity
    )
  end
end

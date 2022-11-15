class ProductOrdersController < ApplicationController
  load_and_authorize_resource

  def create
    @product_order = ProductOrder.new(product_order_params)
    @products = Product.all
    if @product_order.save
      redirect_to products_path, notice: t('.add_to_cart')
    else
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

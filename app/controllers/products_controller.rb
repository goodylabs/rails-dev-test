class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    @product_order = ProductOrder.new
    @order = Order.new
  end
end

class OrdersController < ApplicationController
  load_and_authorize_resource

  def create
    orders_svc = OrdersService.new(current_user.id)
    if orders_svc.create
      redirect_to products_path, notice: t('.order_created')
    else
      @order = orders_svc.order
      respond_to do |format|
        format.js { render 'products/checkout.js.erb', layout: false }
      end
    end
  end
end

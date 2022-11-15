class CartsController < ApplicationController
  load_and_authorize_resource

  def show
    @cart = Cart.find(params[:id])
  end

  

  private

  def cart_params
    params.require(:cart).permit(
      :user_id
    )
  end
end

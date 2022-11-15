class ProductOrdersService
  attr_reader :product_order

  def initialize(product_order_params)
    @product_order_params = product_order_params
    @product_order = ProductOrder.new(product_order_params)
    @cart = Cart.find(product_order_params[:cart_id])
  end

  def create_or_update
    return if @product_order_params.nil? || @product_order.nil? || @cart.nil?

    existing_product_order = @cart.product_orders.joins(:product).find_by(products: {id: @product_order.product.id})
    products_svc = ProductsService.new(@product_order_params[:product_id], @product_order_params[:quantity].to_i)
    if existing_product_order.present?
      new_quantity = existing_product_order.quantity + @product_order_params[:quantity].to_i
      @product_order = existing_product_order
      products_svc.decrease_quantity
      return true if @product_order.update(quantity: new_quantity)
      old_quantity = existing_product_order.quantity - @product_order_params[:quantity].to_i
      @product_order.quantity = old_quantity
      return false
    else
      products_svc.decrease_quantity
      @product_order.save
    end
  end
end
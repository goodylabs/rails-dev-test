class ProductsService
  attr_reader :product

  def initialize(product_id, ordered_quantity)
    @product = Product.find(product_id)
    @ordered_quantity = ordered_quantity
  end

  def decrease_quantity
    return if @product.nil?

    new_quantity = @product.quantity - @ordered_quantity
    @product.update(quantity: new_quantity)
  end

  def increase_quantity
    return if @product.nil?

    new_quantity = @product.quantity + @ordered_quantity
    @product.update(quantity: new_quantity)
  end
end

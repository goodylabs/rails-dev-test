# frozen_string_literal: true

module ProductsHelper
  def product_with_price(product)
    "#{product.name} (#{humanized_money_with_symbol product.price})"
  end
end

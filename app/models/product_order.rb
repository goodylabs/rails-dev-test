class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validate :check_max_quantity
  validate :check_min_quantity

  private

  def check_max_quantity
    return if (quantity == quantity_was ? quantity : quantity - quantity_was) <= product.quantity

    errors.add(:quantity, I18n.t('errors.quantity.check_max_quantity', quantity: product.quantity))
  end

  def check_min_quantity
    return if quantity > 0

    errors.add(:quantity, I18n.t('errors.quantity.check_min_quantity', quantity: product.quantity))
  end
end

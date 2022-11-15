class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validate :check_max_quantity

  private

  def check_max_quantity
    return if quantity <= product.quantity

    errors.add(:quantity, I18n.t('errors.quantity.check_max_quantity', quantity: product.quantity))
  end
end

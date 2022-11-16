class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validates_presence_of :quantity

  validate :check_affiliation
  validate :check_max_quantity
  validate :check_min_quantity

  private

  def check_affiliation
    return if cart_id.present? || order_id.present?

    errors.add(:affiliation, I18n.t('errors.quantity.check_max_quantity'))
  end

  def check_max_quantity
    return if product.blank? || quantity.blank? || quantity <= product.quantity

    errors.add(:quantity, I18n.t('errors.quantity.check_max_quantity', quantity: product.quantity))
  end

  def check_min_quantity
    return if quantity.blank? || quantity > 0

    errors.add(:quantity, I18n.t('errors.quantity.check_min_quantity'))
  end
end

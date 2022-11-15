class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :category
  validates_presence_of :quantity

  validate :check_min_quantity

  enum category: {
    arabica: 0,
    robusta: 1,
    mix: 2
  }
  CATEGORIES = categories.to_h { |k, _v| [k.to_sym, k] }.freeze

  def self.get_categories
    CATEGORIES
  end

  def self.get_human_categories
    CATEGORIES.to_h { |k, _v| [Cv.human_enum_name(:categories, k), k] }
  end

  private
  
  def check_min_quantity
    return if quantity >= 0

    errors.add(:quantity, I18n.t('errors.quantity.check_min_quantity', quantity: quantity))
  end
end

class Product < ApplicationRecord
  has_many :product_orders

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
end

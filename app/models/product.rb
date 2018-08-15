class Product < ActiveRecord::Base
  validates_presence_of :name, :price, :quantity
  has_attached_file :image, :styles => { :medium => "600x600", :thumb => "100x100#", :basic => "262x262#" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :order_products
  accepts_nested_attributes_for :order_products

  scope :in_stock, -> { where('quantity > 0') }
end
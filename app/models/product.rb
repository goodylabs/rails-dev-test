# == Schema Information
#
# Table name: products
#
#  id                 :bigint(8)        not null, primary key
#  name               :string(255)
#  price              :decimal(10, 2)
#  quantity           :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Product < ActiveRecord::Base
  validates_presence_of :name, :price, :quantity
  has_attached_file :image,
                    :styles => {
                        :medium => "600x600",
                        :thumb => "100x100#",
                        :basic => "262x262#"
                    },
                    :default_url => "/assets/default_:style.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :order_products
  accepts_nested_attributes_for :order_products

  scope :in_stock, -> { where('quantity > 0') }
end

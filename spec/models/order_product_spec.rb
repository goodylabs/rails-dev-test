# == Schema Information
#
# Table name: order_products
#
#  id         :bigint(8)        not null, primary key
#  order_id   :bigint(8)
#  product_id :bigint(8)
#  quantity   :integer
#  price      :decimal(10, 2)
#

require "rails_helper"

RSpec.describe OrderProduct, :type => :model do

  subject { described_class.new(order_id: 1, product_id: 1, quantity: 1, price: 198.12) }

  describe "Validations" do

    it "is not valid without order_id" do
      subject.order_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without product_id" do
      subject.product_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it { expect(subject).to belong_to(:order) }
    it { expect(subject).to belong_to(:product) }

  end

end

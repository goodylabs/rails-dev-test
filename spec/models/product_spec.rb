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

require "rails_helper"

RSpec.describe Product, :type => :model do

  subject { described_class.new(name: "product", quantity: 1, price: 19.88) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without name" do
      subject.name = nil
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
  end

  it { expect(subject).to have_many(:order_products) }
end

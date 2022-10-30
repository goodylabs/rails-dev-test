require 'rails_helper'

RSpec.describe Product, type: :model do
  # subject { Product.new(name: "Jogurt naturalny", price:"3.335")}
  subject { Product.new } 
  it "is valid with valid attributes" do
    subject.name = "Jogurt naturalny"
    subject.price = "3.335"
  expect(subject).to be_valid
  end
  it "is not valid without a namee" do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
  end
  it "is not valid without name" do
    subject.price = "3.335"
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without price" do
    subject.name = "Jogurt naturalny"
    subject.price=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a priceee" do
    product = Product.new(price: nil)
    expect(product).to_not be_valid
  end
  it "is not valid without name and price" do
    subject.name = nil
    subject.price=nil
    expect(subject).to_not be_valid
  end
end

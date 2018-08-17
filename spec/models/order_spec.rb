require "rails_helper"

RSpec.describe Order, :type => :model do

  subject { described_class.new(user_id: 1, email: 'test@example.com', address: 'test', total_price: 198.12, created_at: '2018-08-14', updated_at: '2018-08-14') }

  describe "Validations" do

    it "is not valid without user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without total_price" do
      subject.total_price = nil
      expect(subject).to_not be_valid
    end

    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to have_many(:order_products) }

  end

end
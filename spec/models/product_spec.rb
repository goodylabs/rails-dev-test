require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { build(:product) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { is_expected.to monetize(:price) }
  end
  
end

require 'rails_helper'

RSpec.describe CheckoutProcess::Forms::CustomerDetails, type: :model do

  subject(:form) { described_class.new(attributes) }

  describe 'validations' do
    let(:attributes) {
      {
        'email' => 'jan@kowalski.pl'
      }
    }

    context 'validate fields' do
      it { expect(form).to validate_presence_of(:email) }
      it { should allow_value("email@addresse.foo").for(:email) }
      it { should_not allow_value("email").for(:email) }
      it { should_not allow_value("@").for(:email) }
      it { should_not allow_value("@email").for(:email) }
    end
  end
end

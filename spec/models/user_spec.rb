require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(surname: 'Kasperek', email: 'michal.kasperek@example.com', password: 'password', password_confirmation: 'password', address: 'Lodz', credit_card: '12345678901').save
      expect(user).to eq(false)
    end

    it 'ensures surname presence' do
      user = User.new(name: 'Michal', email: 'michal.kasperek@example.com', password: 'password', password_confirmation: 'password', address: 'Lodz', credit_card: '12345678901').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: 'Michal', surname: 'Kasperek', password: 'password', password_confirmation: 'password', address: 'Lodz', credit_card: '12345678901').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(name: 'Michal', surname: 'Kasperek', email: 'michal.kasperek@example.com', password_confirmation: 'password', address: 'Lodz', credit_card: '12345678901').save
      expect(user).to eq(false)
    end

    it 'ensures address presence' do
      user = User.new(surname: 'Kasperek', email: 'michal.kasperek@example.com', password: 'password', password_confirmation: 'password', credit_card: '12345678901').save
      expect(user).to eq(false)
    end
    it 'ensures credit_card presence' do
      user = User.new(surname: 'Kasperek', email: 'michal.kasperek@example.com', password: 'password', password_confirmation: 'password', address: 'Lodz').save
      expect(user).to eq(false)
    end
    it 'save successfully' do
      user = User.new(name: 'Michal', surname: 'Kasperek', email: 'michal.kasperek@example.com', password: 'password', password_confirmation: 'password', credit_card: '12345678901', address: 'Lodz').save
      expect(user).to eq(true)
    end

  end
end
# it 'must have a name' do
  # user = User.new(surname: 'Kasperek').save
  # expect(user).to eq(false)
# end
# it 'must have a surname' do
  # user = User.new(name: 'Michał').save
  # expect(user).to eq(false)
# end
# it 'ensures email presence' do
  # user = User.new(name: 'Michał').save
  # expect(user).to eq(false)
# end
# it 'should save user successfully' do
  # user = User.new(name: 'Michał', surname: "Kasperek", email:"michal.kasperek@example.com", ).save
  # expect(user).to eq(true)
# end
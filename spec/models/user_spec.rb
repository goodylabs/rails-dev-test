require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:example_user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(example_user).to be_valid
  end

  it 'is invalid without first name' do
    example_user.first_name = nil
    expect(example_user).not_to be_valid
  end

  it 'is invalid without last name' do
    example_user.last_name = nil
    expect(example_user).not_to be_valid
  end

  it 'is invalid with invalid email format' do
    example_user.email = 'name'
    expect(example_user).not_to be_valid
  end

  it 'is invalid with invalid credit card format' do
    example_user.email = '1212-2323-absd-3434-2332'
    expect(example_user).not_to be_valid
  end

  it 'is invalid without uppercase in password' do
    example_user.password = 'password!'
    expect(example_user).not_to be_valid
  end

  it 'is invalid without lowercase in password' do
    example_user.password = 'PASSWORD!'
    expect(example_user).not_to be_valid
  end

  it 'is invalid without special character in password' do
    example_user.password = 'Password'
    expect(example_user).not_to be_valid
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :orders

  validate :password_has_uppercase
  validate :password_has_lowercase
  validate :password_has_special
  validate :credit_card_has_proper_format

  validates_presence_of :first_name, :last_name, :email
  validates_length_of :email, maximum: 250
  validates_length_of :first_name, maximum: 250
  validates_length_of :last_name, maximum: 250

  after_create_commit :create_cart

  def ability
    @ability ||= Ability.new(self)
  end

  private

  def password_has_uppercase
    return if password.blank? || password.match(/[A-Z]/)

    errors.add(:password, I18n.t('devise.errors.password.password_has_uppercase'))
  end

  def password_has_lowercase
    return if password.blank? || password.match(/[a-z]/)

    errors.add(:password, I18n.t('devise.errors.password.password_has_lowercase'))
  end

  def password_has_special
    return if password.blank? || password.match(/[^A-Za-z0-9]/)

    errors.add(:password, I18n.t('devise.errors.password.password_has_special'))
  end

  def credit_card_has_proper_format
    return if credit_card.blank? || credit_card.tr(",", "").tr("-", "").match(/^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/)

    errors.add(:credit_card, I18n.t('devise.errors.credit_card.credit_card_has_proper_format'))
  end

  def create_cart
    Cart.create(user_id: id)
  end
end

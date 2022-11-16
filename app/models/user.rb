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
    credit_card_regexes = [
      /^3[47][0-9]{13}$/,
      /^(6541|6556)[0-9]{12}$/,
      /^389[0-9]{11}$/,
      /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/,
      /^65[4-9][0-9]{13}|64[4-9][0-9]{13}|6011[0-9]{12}|(622(?:12[6-9]|1[3-9][0-9]|[2-8][0-9][0-9]|9[01][0-9]|92[0-5])[0-9]{10})$/,
      /^63[7-9][0-9]{13}$/,
      /^(?:2131|1800|35\d{3})\d{11}$/,
      /^9[0-9]{15}$/,
      /^(6304|6706|6709|6771)[0-9]{12,15}$/,
      /^(5018|5020|5038|6304|6759|6761|6763)[0-9]{8,15}$/,
      / ^(5[1-5][0-9]{14}|2(22[1-9][0-9]{12}|2[3-9][0-9]{13}|[3-6][0-9]{14}|7[0-1][0-9]{13}|720[0-9]{12}))$/,
      /^(6334|6767)[0-9]{12}|(6334|6767)[0-9]{14}|(6334|6767)[0-9]{15}$/,
      /^(4903|4905|4911|4936|6333|6759)[0-9]{12}|(4903|4905|4911|4936|6333|6759)[0-9]{14}|(4903|4905|4911|4936|6333|6759)[0-9]{15}|564182[0-9]{10}|564182[0-9]{12}|564182[0-9]{13}|633110[0-9]{10}|633110[0-9]{12}|633110[0-9]{13}$/,
      /^(62[0-9]{14,17})$/,
      /^4[0-9]{12}(?:[0-9]{3})?$/,
      /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$/,
    ]
    credit_card_regexes.each do |credit_card_regex|
      return if credit_card.blank? || credit_card.tr(',', '').tr('-', '').match(credit_card_regex)
    end

    errors.add(:credit_card, I18n.t('devise.errors.credit_card.credit_card_has_proper_format'))
  end

  def create_cart
    Cart.create(user_id: id)
  end
end

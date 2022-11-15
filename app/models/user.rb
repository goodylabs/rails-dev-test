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
  validates_presence_of :first_name, :last_name
  validates_length_of :email, maximum: 250
  validates_length_of :first_name, maximum: 250
  validates_length_of :last_name, maximum: 250

  after_create_commit :create_cart

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

  def ability
    @ability ||= Ability.new(self)
  end

  private

  def create_cart
    Cart.create(user_id: id)
  end
end

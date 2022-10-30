class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {minimum: 2, maximum: 30, message: "is too short. It must be at least 2 characters"}
  validates :surname, presence: true, length: {minimum: 2, maximum: 30, message: "is too short. It must be at least 2 characters"}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :address, :length => {  :in => 2..100 }
  validates :credit_card, length: {minimum: 2, maximum: 30, message: "is incorrect."}

  enum role: [:admin, :moderator, :user]

  after_initialize :set_defaults

  private

  def set_defaults
    if self.new_record?
      self.role ||= :user
    end
  end
  #Ex:- :default =>''

end

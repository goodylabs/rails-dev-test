class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :address, :length => {  :in => 2..100 }

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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  accepts_nested_attributes_for :address

  has_one :card
  accepts_nested_attributes_for :card

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,            presence: true, length: { maximum: 20 }
  validates :email,               presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name,          presence: true, length: { maximum: 35 }
  validates :last_name,           presence: true, length: { maximum: 35 }
  validates :first_name_kana,     presence: true, length: { maximum: 35 }
  validates :last_name_kana,      presence: true, length: { maximum: 35 }
  validates :birthyear,           presence: true
  validates :birthmonth,          presence: true
  validates :birthday,            presence: true
  validates :phone_number,        presence: true, uniqueness: true

end

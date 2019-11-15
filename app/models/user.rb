class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

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

  def self.find_for_oauth(auth)
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    unless sns
      @user = User.create(
      email:    auth.info.email,
      password: Devise.friendly_token[0,20]
      )
      sns = SnsCredential.create(
      user_id: @user.id,
      uid: auth.uid,
      provider: auth.provider
      )
    end
    sns
    @user
  end
end

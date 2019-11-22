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

  has_many :items
  
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

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
end

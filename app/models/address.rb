class Address < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

  belongs_to :user, optional: true
  validates :address_first_name,          presence: true, length: { maximum: 35 }
  validates :address_last_name,           presence: true, length: { maximum: 35 }
  validates :address_first_name_kana,     presence: true, length: { maximum: 35 }
  validates :address_last_name_kana,      presence: true, length: { maximum: 35 }
  validates :postal_code,                 presence: true, length: { maximum: 35 }
  validates :prefecture_id,               presence: true
  validates :city,                        presence: true
  validates :block,                       presence: true

end

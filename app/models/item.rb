class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :item_postage
  belongs_to_active_hash :item_lead_time
  
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  has_many :item_images, dependent: :destroy, index_errors: true
  accepts_nested_attributes_for :item_images

  has_many :comments
  has_many :messages
  has_many :likes

  validates :item_images,
    presence: { message: "がありません" }
  validates :name,
    presence: true,
    length: { maximum: 40 }
  validates :price,
    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "販売価格は¥300以上¥9,999,999以内で入力してください" }
  validates :description,
    presence: true,
    length: { maximum: 1000 }
  validates :condition,
    presence: { message: "を選択して下さい" }
  validates :postage,
    presence: { message: "を選択して下さい" }
  validates :shipping_method,
    presence: { message: "を選択して下さい" }
  validates :lead_time,
    presence: { message: "を選択して下さい" }
  validates :departure_area,
    presence: { message: "を選択して下さい" }
  validates :category_id,
    numericality: { greater_than: 0, message: "を選択して下さい" }

end

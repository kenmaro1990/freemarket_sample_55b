class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  has_many :item_images, dependent: :destroy, index_errors: true, inverse_of: :item
  accepts_nested_attributes_for :item_images

  has_many :comments
  has_many :messages
  has_many :likes
  
end

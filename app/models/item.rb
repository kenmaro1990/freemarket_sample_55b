class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  belongs_to :brand
  has_many :item_images
  accepts_nested_attributes_for :item_images

  has_many :comments
  has_many :messages
  has_many :likes
  
end

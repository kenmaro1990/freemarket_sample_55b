class ItemImage < ApplicationRecord
  belongs_to :item, optional: true, inverse_of: :item_images
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end

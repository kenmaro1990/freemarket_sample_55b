class RenameItemImagesColumnToItemImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :item_images, :item_images, :image
  end
end

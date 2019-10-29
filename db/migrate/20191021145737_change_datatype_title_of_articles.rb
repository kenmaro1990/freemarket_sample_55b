class ChangeDatatypeTitleOfArticles < ActiveRecord::Migration[5.0]
  def change
    change_column :item_images, :item_images, :string
  end
end

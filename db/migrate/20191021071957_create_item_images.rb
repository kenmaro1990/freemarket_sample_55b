class CreateItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :item_images do |t|
      t.integer :item_images
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end

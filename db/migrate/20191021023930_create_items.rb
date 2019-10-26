class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :name,            null: false
      t.text    :description,     null: false
      t.string  :price,           null: false
      t.integer :seller_id,       null: false, foreign_key: true
      t.integer :buyer_id,        foreign_key: true
      t.integer :category_id,     foreign_key: true
      t.string  :size
      t.integer :brand_id,        foreign_key: true
      t.string  :condition,       null: false
      t.string  :postage,         null: false
      t.string  :shipping_method, null: false
      t.string  :departure_area,  null: false
      t.string  :lead_time,       null: false
      t.string  :display,         null: false
      t.string  :order_status
      t.timestamps
    end
  end
end

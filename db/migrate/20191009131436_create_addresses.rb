class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :address_first_name, null: false
      t.string :address_last_name, null: false
      t.string :address_first_name_kana, null: false
      t.string :address_last_name_kana, null: false
      t.string :postal_code,null: false
      t.integer :prefecture_id
      t.string :city,null: false
      t.string :block,null: false
      t.string :building
      t.string :phone_number
      t.timestamps
    end
  end
end

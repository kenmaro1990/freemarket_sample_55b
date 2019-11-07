class AddUserRefToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :size, foreign_key: true
  end
end

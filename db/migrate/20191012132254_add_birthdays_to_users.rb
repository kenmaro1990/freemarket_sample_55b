class AddBirthdaysToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthyear, :integer, null: false
    add_column :users, :birthmonth, :integer, null: false
    add_column :users, :birthday, :integer, null: false
  end
end

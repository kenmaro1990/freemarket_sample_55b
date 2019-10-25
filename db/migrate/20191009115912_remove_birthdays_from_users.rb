class RemoveBirthdaysFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :birthdate_year, :integer
    remove_column :users, :birthdate_month, :integer
    remove_column :users, :birthdate_day, :integer
  end
end

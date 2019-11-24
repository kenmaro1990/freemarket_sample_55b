class ChangeDatatypeSizeOfSizes < ActiveRecord::Migration[5.0]
  def change
    change_column :sizes, :size, :string
  end
end

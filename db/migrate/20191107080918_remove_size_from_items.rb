class RemoveSizeFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :size, :integer
  end
end

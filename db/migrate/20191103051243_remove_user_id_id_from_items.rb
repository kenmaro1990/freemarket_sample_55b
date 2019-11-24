class RemoveUserIdIdFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :user_id_id, :reference
  end
end

class ChangeDataPriceToItem < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :price, :integer
  end
end

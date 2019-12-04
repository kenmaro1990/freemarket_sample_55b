class AddColumnToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :description, :text
    add_column :brands, :imege, :string
  end
end

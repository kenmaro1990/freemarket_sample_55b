class AddAncestryToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :ancestry, :string
    add_index :brands, :ancestry
  end
end

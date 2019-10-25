class RenamePhoneNumberColumnToAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :phone_number, :address_phone_number
  end
end

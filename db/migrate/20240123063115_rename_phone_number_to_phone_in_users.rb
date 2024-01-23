class RenamePhoneNumberToPhoneInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :phone_number, :phone
  end
end

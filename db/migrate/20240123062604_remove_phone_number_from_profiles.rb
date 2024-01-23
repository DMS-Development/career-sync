class RemovePhoneNumberFromProfiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :phone_number, :string
  end
end

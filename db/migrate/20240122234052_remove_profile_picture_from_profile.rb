class RemoveProfilePictureFromProfile < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :profile_picture, :string
  end
end

class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :profile_picture
      t.json :educations
      t.json :experiences
      t.json :skills

      t.timestamps
    end
  end
end
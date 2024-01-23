class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :street
      t.string :streetTwo
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
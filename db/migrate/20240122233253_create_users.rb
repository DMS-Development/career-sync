class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :email
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
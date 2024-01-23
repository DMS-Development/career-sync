class CreateResumes < ActiveRecord::Migration[7.1]
  def change
    create_table :resumes, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :file_path
      t.string :file_name
      t.datetime :upload_date

      t.timestamps
    end
  end
end
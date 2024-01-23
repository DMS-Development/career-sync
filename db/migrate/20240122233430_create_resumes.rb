class CreateResumes < ActiveRecord::Migration[7.1]
  def change
    create_table :resumes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :file_path
      t.string :file_name
      t.datetime :upload_date

      t.timestamps
    end
  end
end

class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :job, null: false, foreign_key: true, type: :uuid
      t.string :application_status
      t.datetime :application_date

      t.timestamps
    end
  end
end
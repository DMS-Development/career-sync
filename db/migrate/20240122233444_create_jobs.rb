class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :posted_date
      t.datetime :closing_date

      t.timestamps
    end
  end
end

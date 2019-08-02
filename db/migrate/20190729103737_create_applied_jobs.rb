class CreateAppliedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :applied_jobs do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :job_title
      t.string :company_name
      t.text :application
      t.integer :application_type_id
      t.integer :application_status_id

      t.timestamps
    end
  end
end

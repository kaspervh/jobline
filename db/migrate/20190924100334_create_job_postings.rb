class CreateJobPostings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_postings do |t|
      t.integer :job_type_id
      t.text :main_text
      t.string :address
      t.string :zip
      t.string :phone
      t.string :email
      t.string :application_deadline

      t.timestamps
    end
  end
end

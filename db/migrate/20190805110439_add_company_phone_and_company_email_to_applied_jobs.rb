class AddCompanyPhoneAndCompanyEmailToAppliedJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :applied_jobs, :company_phone, :string
    add_column :applied_jobs, :company_email, :string
  end
end

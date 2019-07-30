json.extract! applied_job, :id, :user_id, :job_id, :job_title, :company_name, :application, :application_type_id, :application_status_id, :created_at, :updated_at
json.url applied_job_url(applied_job, format: :json)

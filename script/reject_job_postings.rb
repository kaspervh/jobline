# if a user has applied to a job, but havvent heard from the company in over 2 months.
# then the platform will automaticaly set the applied job to rejected.

AppliedJob.all.each do |aj|
  if aj.application_status_id == 1 &&  aj.updated_at <= Date.today - 2.months
    aj.application_status_id = 3
    aj.save
  end
end
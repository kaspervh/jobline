class JobPostingsController < ApplicationController
  def index
    @job_postings = JobPosting.all
    @job_types = JobType.all
  end
end

class JobPostingsController < ApplicationController
  layout 'empty', only: [:show]

  def index
    @job_postings = JobPosting.all
    @job_types = JobType.all
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end
end

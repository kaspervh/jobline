class AppliedJobsController < ApplicationController
  before_action :set_applied_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout 'empty', only: [:new, :show]

  def index
    @applied_jobs = AppliedJob.all
    @interview = @applied_jobs.where(application_status_id: 2)
    @awating = @applied_jobs.where(application_status_id: 1)
    @rejected = @applied_jobs.where(application_status_id: 3)
    @application_satus = ApplicationStatus.all
  end

  def new
    @applied_job = AppliedJob.new
    @job_posting = JobPosting.find(params[:job_posting_id]) if params[:job_posting_id].present?
    @application_types = ApplicationType.all
    @application_statuses = ApplicationStatus.all
    @standart_application = current_user.standart_application.content.body.html_safe
  end

  def create
    @applied_job = AppliedJob.new(applied_job_params)

    @applied_job.save ? redirect_back(fallback_location: root_path) : redirect_back(fallback_location: root_path)
  end

  def update
    @applied_job.update(applied_job_params) ? redirect_back(fallback_location: applied_jobs_path) : redirect_back(fallback_location: applied_jobs_path)
  end 

  def destroy
    @applied_job.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def set_applied_job
      @applied_job = AppliedJob.find(params[:id])
    end

    def applied_job_params
      params.require(:applied_job).permit(:user_id, :job_id, :job_title, :company_name, :company_phone, :company_email, :application, :application_type_id, :application_status_id)
    end
end

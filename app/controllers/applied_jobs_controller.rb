class AppliedJobsController < ApplicationController
  before_action :set_applied_job, only: [:show, :edit, :update, :destroy]

  # GET /applied_jobs
  # GET /applied_jobs.json
  def index
    @applied_jobs = AppliedJob.all
  end

  # GET /applied_jobs/1
  # GET /applied_jobs/1.json
  def show
  end

  # GET /applied_jobs/new
  def new
    @applied_job = AppliedJob.new
  end

  # GET /applied_jobs/1/edit
  def edit
  end

  # POST /applied_jobs
  # POST /applied_jobs.json
  def create
    @applied_job = AppliedJob.new(applied_job_params)

    respond_to do |format|
      if @applied_job.save
        format.html { redirect_to @applied_job, notice: 'Applied job was successfully created.' }
        format.json { render :show, status: :created, location: @applied_job }
      else
        format.html { render :new }
        format.json { render json: @applied_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applied_jobs/1
  # PATCH/PUT /applied_jobs/1.json
  def update
    respond_to do |format|
      if @applied_job.update(applied_job_params)
        format.html { redirect_to @applied_job, notice: 'Applied job was successfully updated.' }
        format.json { render :show, status: :ok, location: @applied_job }
      else
        format.html { render :edit }
        format.json { render json: @applied_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applied_jobs/1
  # DELETE /applied_jobs/1.json
  def destroy
    @applied_job.destroy
    respond_to do |format|
      format.html { redirect_to applied_jobs_url, notice: 'Applied job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applied_job
      @applied_job = AppliedJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applied_job_params
      params.require(:applied_job).permit(:user_id, :job_id, :job_title, :company_name, :application, :application_type_id, :application_status_id)
    end
end

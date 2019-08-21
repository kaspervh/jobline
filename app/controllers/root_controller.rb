class RootController < ApplicationController
  layout 'welcome', only: [:welcome]

  before_action :authorize, only: [:home]

  def welcome
  end

  def home
    # helper variables
  	this_month = Date.current.beginning_of_month..Date.current.end_of_month
  	this_week = Date.today.beginning_of_week..Date.today.end_of_week
  	@applied_jobs = current_user.applied_jobs

    #global variable for the followup
    @followup_jobs = @applied_jobs.where(application_status_id: 1).select{|aj| aj.updated_at < Date.today - 14.days}
    
    # global variable for users contacts
    @contacts = current_user.contacts


    #global variables for job job search numbers
    @applications_this_month = @applied_jobs.where(created_at: this_month).count
    @applications_this_week = @applied_jobs.where(created_at: this_week).count
    @interview_invites_this_month = @applied_jobs.where(application_status_id: 2, updated_at: this_month).count
   	@interview_invites_total = @applied_jobs.where(application_status_id: 2).count
   	@applications_by_phone = @applied_jobs.where(application_type_id: 1).count
   	@applications_in_person = @applied_jobs.where(application_type_id: 2).count
   	@applications_written = @applied_jobs.where(application_type_id: 3).count
   	@succes_rate = @applied_jobs.any? ? @applied_jobs.where(application_status_id:2).count / (@applied_jobs.where(application_status_id: 1).count + @applied_jobs.where(application_status_id: 3).count) * 100 : 0 
  end
end

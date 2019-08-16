class RootController < ApplicationController
  layout 'welcome', only: [:welcome]

  before_action :authorize, only: [:home]

  def welcome
  end

  def home
  	this_month = Date.current.beginning_of_month..Date.current.end_of_month
  	this_week = Date.today.beginning_of_week..Date.today.end_of_week
  	applied_jobs = current_user.applied_jobs
    @contacts = current_user.contacts
    @applications_this_month = applied_jobs.where(created_at: this_month).count
    @applications_this_week = applied_jobs.where(created_at: this_week).count
    @interview_invites_this_month = applied_jobs.where(application_status_id: 2, updated_at: this_month).count
   	@interview_invites_total = applied_jobs.where(application_status_id: 2).count
   	@applications_by_phone = applied_jobs.where(application_type_id: 1).count
   	@applications_in_person = applied_jobs.where(application_type_id: 2).count
   	@applications_written = applied_jobs.where(application_type_id: 3).count
   	@succes_rate =  applied_jobs.where(application_status_id:2).count / (applied_jobs.where(application_status_id: 1).count + applied_jobs.where(application_status_id: 3).count) * 100 
  end
end

class RootController < ApplicationController
  layout 'welcome', only: [:welcome]

  before_action :authorize, only: [:home]

  def welcome
  end

  def home
  	this_month = Date.current.beginning_of_month..Date.current.end_of_month
  	this_week = Date.today.beginning_of_week..Date.today.end_of_week
    @contacts = current_user.contacts
    @applications_this_month = current_user.applied_jobs.where(created_at: this_month).count
    @applications_this_week = current_user.applied_jobs.where(created_at: this_week).count
    @interview_invites_this_month = current_user.applied_jobs.where(application_status_id: 2, updated_at: this_month).count
   	@interview_invites_total = current_user.applied_jobs.where(application_status_id: 2).count
    	
  end
end

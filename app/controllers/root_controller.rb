class RootController < ApplicationController
  layout 'welcome', only: [:welcome]
  def welcome
  end

  def home
    redirect_to welcome_path unless current_user

    @contacts = current_user.contacts
  end
end

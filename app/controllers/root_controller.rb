class RootController < ApplicationController
  layout 'welcome', only: [:welcome]

  before_action :authorize, only: [:home]

  def welcome
  end

  def home
    @contacts = current_user.contacts
  end
end

class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_user?
    current_user != nil
  end

  def authorize
    redirect_to '/login' unless current_user
  end
  helper_method :authorize
end

class SessionsController < ApplicationController
  layout 'forms'

  before_action :authorize, only:[:destroy]
  
  def new
  end

  def create
    # sees if there is a user with same email
    user = User.find_by_email(params[:email])

    # if the user existst and has the same password as typed in
    # a session is created and user will be redirected to root path
    # if not user will be sendt to login path to try again
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else 
      redirect_to login_path
    end
  end

  # session wil be reduced to a nil value
  #and user will be redirected to the welcome page
  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end
end

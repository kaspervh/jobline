class UsersController < ApplicationController
  layout 'forms'

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else 
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

class UsersController < ApplicationController
  layout :choose_layout


  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to login_path
    else 
      redirect_to signup_path
    end
  end

  def edit
    
  end

  def update
    @user = User.find(params[:id])

    @user.update_attributes(user_params)
    redirect_back(fallback_location: root_path)
  end

  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def choose_layout
    return 'forms' if action_name == 'new'
    return 'empty' if action_name == 'edit'
  end

end

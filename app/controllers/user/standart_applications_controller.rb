class User::StandartApplicationsController < ApplicationController
  before_action :set_user_standart_application, only: [:show, :edit, :update, :destroy]

  def index
    @user_standart_applications = User::StandartApplication.all
  end

  def show
  end

  def new
    @user_standart_application = User::StandartApplication.new
  end

  def edit
  end

  def create
    @user_standart_application = User::StandartApplication.new(user_standart_application_params)

    if @user_standart_application.save
      redirect_back(fallback_location: root_path)
    else
      render :new 
    end
  end

  def update
    @user_standart_application = User::StandartApplication.find(params[:id])

    if @user_standart_application.update(user_standart_application_params)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user_standart_application.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_standart_application
      @user_standart_application = User::StandartApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_standart_application_params
      params.require(:user_standart_application).permit(:user_id, :application)
    end
end

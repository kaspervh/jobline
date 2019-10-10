class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout 'empty', only: [:new]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    @contact.save ? redirect_back(fallback_location: root_path) : redirect_back(fallback_location: root_path)
    
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:user_id, :name, :position, :email, :phone)
    end
end

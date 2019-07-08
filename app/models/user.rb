class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_digest

  has_many :contacts
  has_one :standart_application

end

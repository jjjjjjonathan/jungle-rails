class User < ActiveRecord::Base

  has_secure_password

  validates :given_name, presence: true
  validates :surname, presence: true
  validates :email, presence: true
  
end

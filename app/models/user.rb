class User < ActiveRecord::Base

  before_validation do
    self.email = email&.downcase
  end

  has_secure_password

  validates :given_name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)
    if user&.authenticate(password)
      user
    else
      nil
    end
  end 
end

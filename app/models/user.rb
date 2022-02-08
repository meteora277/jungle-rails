class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def parse_email
    self.email = self.email.downcase.strip
  end

  has_secure_password
  validates :password, :email, :first_name, :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: {minimum: 8}
  validates_confirmation_of :password
  validates :email, :uniqueness => {:case_sensitive => false}



end

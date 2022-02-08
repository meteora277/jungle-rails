class User < ActiveRecord::Base

  has_secure_password
  validates :password, :email, :first_name, :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: {minimum: 8}
  validates_confirmation_of :password
  validates :email, :uniqueness => {:case_sensitive => false}

end

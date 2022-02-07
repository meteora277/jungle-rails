class User < ActiveRecord::Base

  has_secure_password
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: {minimum: 8}
  validates_confirmation_of :password

end

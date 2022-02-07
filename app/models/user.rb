class User < ActiveRecord::Base

  has_secure_password
  validates :password, length : {minimum: 8}
  validates :password, comparison: {equal_to: :password_confirmation}
end

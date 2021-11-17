class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
end

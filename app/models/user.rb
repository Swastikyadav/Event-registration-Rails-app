class User < ApplicationRecord
  has_secure_password # This line adds validation for password and also hashes it.

  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }
end

class User < ApplicationRecord
  validates :first_name, :last_name, :role, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, confirmation: true, presence: true
  # validates_associated:
  has_secure_password

  enum role: ['default', 'admin']
end
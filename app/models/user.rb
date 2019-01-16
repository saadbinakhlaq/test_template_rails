class User < ApplicationRecord
  has_secure_password
  has_one :account, dependent: :destroy

  validates :email, presence: true, 'valid_email_2/email': true
  validates :password, length: { minimum: 6 }
end

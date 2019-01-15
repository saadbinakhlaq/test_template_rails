class User < ApplicationRecord
  has_secure_password
  has_one :account, dependent: :destroy
end

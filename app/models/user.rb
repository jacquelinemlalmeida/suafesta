class User < ApplicationRecord
  has_secure_password

  enum role: { usuario: 0, admin: 1 }

  validates :email, presence: true, uniqueness: true
end

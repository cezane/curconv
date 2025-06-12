class User < ApplicationRecord
  validates :name, presence: true
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "is already registered." }
end

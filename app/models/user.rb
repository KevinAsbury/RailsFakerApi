class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, on: :create
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
end

class User < ApplicationRecord
  has_secure_password
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, dependent: :destroy
end

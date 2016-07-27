class User < ActiveRecord::Base
  require 'NetAddr'

  has_many :rules
  validates :username, presence: true, length: {maximum: 50}, uniqueness: true
  has_secure_password
  validates :password, presence: true

end

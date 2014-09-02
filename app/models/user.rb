class User < ActiveRecord::Base
  has_secure_password

  validates :name, uniqueness: true, presence: true

  has_many :questions
  has_many :responses
end

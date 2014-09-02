class Response < ActiveRecord::Base
  validates :response, uniqueness: true, presence: true

  belongs_to :user
end

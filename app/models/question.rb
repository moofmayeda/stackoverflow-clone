class Question < ActiveRecord::Base
  validates :question, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true

  has_many :responses
  belongs_to :user
end

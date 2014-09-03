class Response < ActiveRecord::Base
  validates :response, uniqueness: true, presence: true

  belongs_to :user
  belongs_to :question
  has_many :votes

  def count
    2
  end
end

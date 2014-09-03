class Response < ActiveRecord::Base
  validates :response, uniqueness: true, presence: true

  belongs_to :user
  belongs_to :question
  has_many :votes

  def count
    Vote.where(response_id: self.id).count
  end
end

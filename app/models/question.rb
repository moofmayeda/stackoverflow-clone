class Question < ActiveRecord::Base
  validates :question, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true

  has_many :responses
  belongs_to :user
  has_one :best_response

  def best_first
    self.responses.sort_by { |response| BestResponse.find_by(response_id: response.id)? 0 : 1 }
  end
end

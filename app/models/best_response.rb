class BestResponse < ActiveRecord::Base
  belongs_to :response
  belongs_to :question

  validates_uniqueness_of :response_id, scope: :question
end

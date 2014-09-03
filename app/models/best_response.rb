class BestResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  belongs_to :question

  validates_uniqueness_of :user_id, scope: :question
end

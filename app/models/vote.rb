class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :response
  validates_uniqueness_of :user_id, scope: :response_id
end

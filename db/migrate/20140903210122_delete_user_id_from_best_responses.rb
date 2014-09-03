class DeleteUserIdFromBestResponses < ActiveRecord::Migration
  def change
    remove_column :best_responses, :user_id
  end
end

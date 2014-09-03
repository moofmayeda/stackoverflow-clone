class AddQuestionId < ActiveRecord::Migration
  def change
      add_column :best_responses, :question_id, :integer
  end
end

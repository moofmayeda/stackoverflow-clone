class MakeChosenItsOwnTable < ActiveRecord::Migration
  def change
    remove_column :responses, :chosen
    create_table :best_responses do |t|
      t.belongs_to :user
      t.belongs_to :response
    end
  end
end

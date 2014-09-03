class MarkResponses < ActiveRecord::Migration
  def change
    add_column :responses, :chosen, :boolean, default: false

    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :response
    end
  end
end

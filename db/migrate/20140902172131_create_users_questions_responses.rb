class CreateUsersQuestionsResponses < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    create_table :questions do |t|
      t.string :question
      t.text :description
      t.belongs_to :user
      t.timestamps
    end

    create_table :responses do |t|
      t.text :response
      t.belongs_to :question
      t.belongs_to :user
      t.timestamps
    end
  end
end

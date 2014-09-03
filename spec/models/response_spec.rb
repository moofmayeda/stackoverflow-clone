require 'rails_helper'

describe Response do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should have_many :votes }

  describe "count" do
    it "returns the number of votes that response has received" do
      DatabaseCleaner.clean
      user = User.create(name: "questioner", password: "password")
      test_question = user.questions.create(question: "What?")
      user1 = User.create(name: "one", password: "password")
      user2 = User.create(name: "two", password: "password")
      user3 = User.create(name: "three", password: "password")
      best_response = Response.create(response: "Why?", question_id: 1, user_id: user1.id)
      worst_response = Response.create(response: "YES", question_id: 1, user_id: user2.id)
      user3.votes.create(response_id: best_response.id)
      user2.votes.create(response_id: best_response.id)
      expect(best_response.count).to eq 2
    end

    it "returns the number of votes that response has received" do
      DatabaseCleaner.clean
      user = User.create(name: "questioner", password: "password")
      test_question = user.questions.create(question: "What?")
      user1 = User.create(name: "one", password: "password")
      user2 = User.create(name: "two", password: "password")
      user3 = User.create(name: "three", password: "password")
      best_response = Response.create(response: "Why?", question_id: 1, user_id: user1.id)
      worst_response = Response.create(response: "YES", question_id: 1, user_id: user2.id)
      user3.votes.create(response_id: best_response.id)
      user2.votes.create(response_id: best_response.id)
      expect(worst_response.count).to eq 0
    end
  end
end

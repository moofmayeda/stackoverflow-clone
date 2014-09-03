require 'rails_helper'

describe Response do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should have_many :votes }

  describe "count" do
    it "returns the number of votes that response has received" do
      user = User.create(name: "questioner", password: "password")
      test_question = user.questions.create(question: "What?")
      user1 = User.create(name: "one", password: "password")
      user2 = User.create(name: "two", password: "password")
      user3 = User.create(name: "three", password: "password")
      best_response = user1.responses.create(response: "Why?", question_id: 1)
      worst_response = user2.responses.create(response: "YES", question_id: 1)
      user3.votes.create(response_id: 1)
      user2.votes.create(response_id: 1)
      expect(best_response.count).to eq 2
      expect(worst_response.count).to eq 0
    end
  end
end

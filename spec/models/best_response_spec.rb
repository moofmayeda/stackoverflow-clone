require 'rails_helper'

describe BestResponse do
  it { should belong_to :response }
  it { should belong_to :question }

  it "only allows one best response for one question" do
    DatabaseCleaner.clean
    user = User.create(name: "questioner", password: "password", password_confirmation: "password")
    question = Question.create(question: "what?", description: "what what?", user_id: user.id)
    responder1 = User.create(name: "responder1", password: "password", password_confirmation: "password")
    response1 = Response.create(response: "response1", question_id: question.id, user_id: responder1.id)
    responder2 = User.create(name: "responder2", password: "password", password_confirmation: "password")
    response2 = Response.create(response: "response2", question_id: question.id, user_id: responder2.id)
    BestResponse.create(question_id: question.id, response_id: response2.id)
    BestResponse.create(question_id: question.id, response_id: response1.id)
    expect(question.best_response.response).to eq response2
  end
end

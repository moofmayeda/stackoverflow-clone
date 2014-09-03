require 'rails_helper'

describe "creating a new response" do
  before(:each) do
    DatabaseCleaner.clean
    @question_poster = User.create(name: "ali", password: "password", password_confirmation: "password")
    responder = User.create(name: "moof", password: "password", password_confirmation: "password")
    @test_question = Question.create(question: "What is coding", description: "I really don't get it", user_id: @question_poster.id)
  end

  it "is successful if the user is signed in", js: true do
    visit '/'
    click_link 'Login'
    fill_in 'Name', :with => "moof"
    fill_in 'Password', :with => "password"
    click_button 'Sign In'
    visit "/users/#{@question_poster.id}/questions/#{@test_question.id}"
    fill_in 'Response', :with => "This question is silly"
    click_button 'Create Response'
    expect(page).to have_content "This question is silly"
  end
end

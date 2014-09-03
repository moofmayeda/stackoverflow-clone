require 'rails_helper'

describe "mark as chosen answer" do
  before(:each) do
    DatabaseCleaner.clean
    @question_poster = User.create(name: "ali", password: "password", password_confirmation: "password")
    @responder = User.create(name: "moof", password: "password", password_confirmation: "password")
    @test_question = Question.create(question: "What is coding", description: "I really don't get it", user_id: @question_poster.id)
    @response = Response.create(response: "the best thing", user_id: @responder.id, question_id: @test_question.id)
    bad_response = Response.create(response: "this is totally unhelpful", user_id: @responder.id, question_id: @test_question.id)
  end

  it "is successful if the user who asked the question is signed in", js: true do
    visit '/'
    click_link 'Login'
    fill_in 'Name', :with => "ali"
    fill_in 'Password', :with => "password"
    click_button 'Sign In'
    visit "/users/#{@question_poster.id}/questions/#{@test_question.id}"
    within("#chosen_link_#{@response.id}") do
      click_on('Mark best')
    end
    expect(page).to have_content "Best Answer"
  end

  # it "is not successful if a user is not signed in" do
  #   visit "/users/#{@question_poster.id}/questions/#{@test_question.id}"
  #   expect(page).to have_no_content "Create Response"
  # end
end

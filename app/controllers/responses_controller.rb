class ResponsesController < ApplicationController
  before_filter :authorize

  def new
    @question = Question.find(params[:question_id])
    @response = current_user.responses.new
  end
end

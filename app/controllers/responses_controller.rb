class ResponsesController < ApplicationController
  before_filter :authorize

  def create
    @question = Question.find(params[:question_id])
    @response = current_user.responses.create!(response_params.merge(question_id: params[:question_id]))
    respond_to do |format|
      format.html { redirect_to user_question_path(@question.user, @question) }
      format.js
    end
  end

private
  def response_params
    params.require(:response).permit(:response)
  end
end

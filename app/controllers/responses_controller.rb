class ResponsesController < ApplicationController
  before_filter :authorize

  def create
    @question = Question.find(params[:question_id])
    @response = Response.create!(response_params)
    respond_to do |format|
      format.html { redirect_to user_question_path(@question.user, @question) }
      format.js
    end
  end

  def edit
    @response = Response.find(params[:id])
    @question = @response.question
  end

  def update
    @response = Response.find(params[:id])
    if @response.update(response_params)
      respond_to do |format|
        format.html { redirect_to user_question_path(@response.question.user, @response.question) }
        format.js
      end
    end
  end

private
  def response_params
    params.require(:response).permit(:response).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end

class BestResponsesController < ApplicationController
  def create
    @response = Response.find(params[:response_id])
    @old_response = @response.question.best_response.response
    @response.question.best_response.destroy
    best = BestResponse.create(response_id: @response.id, question_id: @response.question.id)
    respond_to do |format|
      format.html { redirect_to user_question_path(@response.question.user, @response.question) }
      format.js
    end
  end
end

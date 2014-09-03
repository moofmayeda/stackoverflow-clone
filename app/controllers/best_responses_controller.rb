class BestResponsesController < ApplicationController
  def create
    @response = Response.find(params[:response_id])
    @response.question.best_response.destroy
    best = BestResponse.new(response_id: @response.id, question_id: @response.question.id)
    if best.save
      flash[:notice] = "Marked as best answer!"
      redirect_to user_question_path(@response.question.user, @response.question)
    else
      flash[:alert] = "Not marked"
      redirect_to user_question_path(@response.question.user, @response.question)
    end
  end
end

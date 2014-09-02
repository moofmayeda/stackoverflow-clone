class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @user=User.find(params[:user_id])
    @question = @user.questions.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question submitted!"
      redirect_to user_question_path(@user, @question)
    else
      render "new"
    end
  end

  def show
    @question = Question.find(params[:id])
  end

private
  def question_params
    params.require(:question).permit(:question, :description)
  end
end

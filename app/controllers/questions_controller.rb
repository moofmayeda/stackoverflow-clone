class QuestionsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

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
    if current_user
      @response = current_user.responses.new
    else
      @response = Response.new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated!"
      redirect_to user_question_path(@question.user, @question)
    else
      render 'edit'
    end
  end

private
  def question_params
    params.require(:question).permit(:question, :description)
  end
end

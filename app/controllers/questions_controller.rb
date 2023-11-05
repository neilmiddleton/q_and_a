class QuestionsController < ApplicationController
  def new
    @question = Question.new(user_id: current_user)
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc)
  end

  def create
    @question = Question.new(question_params.merge(user_id: current_user))
    if @question.save
      flash[:notice] = "Question created"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end
end

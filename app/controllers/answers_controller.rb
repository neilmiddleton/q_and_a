class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params.merge(user_id: current_user))
    if @answer.save
      flash[:notice] = "Answer posted"
      redirect_to @question
    else
      render "questions/show", status: :unprocessable_entity
    end
  end

  def answer_params
    params.require(:answer).permit(:text)
  end
end

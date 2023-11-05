class HomeController < ApplicationController
  def index
    @your_questions = Question.where(user_id: current_user)
    @unanswered_questions = Question.needs_answer_from(current_user)
  end
end

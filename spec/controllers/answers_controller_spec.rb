require "rails_helper"

describe AnswersController do
  let(:question) {
    Question.create(text: "This is a question")
  }

  describe "POST #create" do
    context "when the answer is valid" do
      it "renders fine" do
        expect {
          post :create, params: {
            question_id: question.id,
            answer: {text: "This is an answer"}
          }
        }.to change { Answer.count }.by(1)
        expect(response).to redirect_to(question)
        expect(flash[:notice]).to match(/^Answer posted/)
      end
    end

    context "when the question is not valid" do
      it "renders errors" do
        expect {
          post :create, params: {
            question_id: question.id,
            answer: {text: ""}
          }
        }.to change { Answer.count }.by(0)
        expect(response).to render_template("questions/show")
      end
    end
  end
end

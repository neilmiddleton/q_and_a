require "rails_helper"

describe QuestionsController do
  describe "POST #create" do
    context "when the question is valid" do
      it "renders fine" do
        expect {
          post :create, params: {question: {text: "This is a question"}}
        }.to change { Question.count }.by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to match(/^Question created/)
      end
    end

    context "when the question is not valid" do
      it "renders errors" do
        expect {
          post :create, params: {question: {text: ""}}
        }.to change { Question.count }.by(0)
        expect(response).to render_template(:new)
      end
    end
  end
end

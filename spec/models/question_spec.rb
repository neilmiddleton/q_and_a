require "rails_helper"

describe Question, type: :model do
  let(:user_id) { SecureRandom.uuid }

  it { should have_many(:answers) }
  it { should validate_presence_of(:text) }

  it "knows if a question is answered by someone" do
    question = Question.create(user_id: user_id, text: "Foo")
    question.answers.create(user_id: user_id, text: "Foo")
    expect(question.answered_by?(user_id)).to be true
    expect(question.answered_by?(SecureRandom.uuid)).to be false
  end

  it "knows which questions need an answer from a user" do
    question = Question.create(user_id: user_id, text: "Foo")
    expect(Question.needs_answer_from(user_id)).to eq([])

    user_id2 = SecureRandom.uuid
    expect(Question.needs_answer_from(user_id2)).to include(question)
    Answer.create(question:, user_id: user_id2, text: "Foo")
    expect(Question.needs_answer_from(user_id2)).to eq([])
  end
end

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :text, presence: true

  scope :needs_answer_from, ->(user_id) {
    where_not_exists(:answers, user_id: user_id).where.not(user_id: user_id)
  }

  def answered_by?(user_id)
    answers.where(user_id: user_id).any?
  end
end

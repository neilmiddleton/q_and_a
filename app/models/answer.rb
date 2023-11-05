class Answer < ApplicationRecord
  belongs_to :question, counter_cache: true

  validates :text, presence: true
end

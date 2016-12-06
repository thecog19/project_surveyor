class PossibleAnswer < ApplicationRecord
  validates :body, presence: true
  has_many :question_responses_answers
  belongs_to :question
end

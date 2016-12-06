class QuestionResponse < ApplicationRecord
  belongs_to :question
  belongs_to :survey_response
  belongs_to :user
  has_many :question_responses_answers
  has_many :answers, through: :question_responses_answers, source: :possible_answer
end

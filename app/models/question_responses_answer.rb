class QuestionResponsesAnswer < ApplicationRecord
  belongs_to :question_response
  belongs_to :possible_answer
end

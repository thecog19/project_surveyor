class QuestionResponse < ApplicationRecord
  belongs_to :question
  belongs_to :survey_response
  belongs_to :user
  has_many :possible_answers, through: :question
end

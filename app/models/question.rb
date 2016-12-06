class Question < ApplicationRecord
  belongs_to :survey, optional: true
  belongs_to :question_type
  has_many :possible_answers
  has_many :submitted_answers, class_name: "QuestionResponse"
end

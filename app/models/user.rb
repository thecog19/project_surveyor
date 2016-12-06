class User < ApplicationRecord
  has_many :submitted_answers, class_name: "QuestionResponse"
  has_many :survey_responses
  has_many :submitted_surveys, through: :survey_responses, source: :survey
end

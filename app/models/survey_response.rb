class SurveyResponse < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :submitted_answers, class_name: "QuestionResponse"
end

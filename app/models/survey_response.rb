class SurveyResponse < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :submitted, class_name: "QuestionResponse"
end

class Survey < ApplicationRecord
  validates :name, presence: true
  has_many :questions # polymorphic child type?
  has_many :responses, class_name: "SurveyResponse"
end

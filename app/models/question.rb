class Question < ApplicationRecord
  validates :question_type_id, presence: true
  belongs_to :survey, optional: true
  belongs_to :category, foreign_key: "question_type_id", class_name: "QuestionType"
  has_many :possible_answers
  has_many :submitted_answers, class_name: "QuestionResponse"

  def category_description
    category.description
  end

  def possible_answers_count
    possible_answers.length
  end
end

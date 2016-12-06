class Survey < ApplicationRecord
  has_many :questions
  has_many :surveyuser
  has_many :users, through: :surveyuser

  validates :name, presence: true
  accepts_nested_attributes_for :questions, allow_destroy: true
end

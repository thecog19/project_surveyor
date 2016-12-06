class Question < ApplicationRecord
  belongs_to :survey, optional: true
  belongs_to :type
  has_many :possible_answers
end

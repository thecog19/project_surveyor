class Question < ApplicationRecord
  belongs_to :survey, optional: true
  has_one :type
  has_many :possible_answers
end
